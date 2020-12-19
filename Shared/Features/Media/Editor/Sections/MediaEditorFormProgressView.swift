//
//  MediaEditorFormProgressView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/14/20.
//

import SwiftUI

struct MediaEditorFormProgressView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let repeatBinding = Binding {
            viewModel.media!.mediaListEntry?.repeat ?? 0
        } set: { repeats in
            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, repeat: repeats)
            } else {
                viewModel.media!.mediaListEntry!.repeat = repeats
            }
        }

        let progressBinding = Binding {
            Double(viewModel.media!.mediaListEntry?.progress ?? 0)
        } set: { progress in
            let progress = Int(progress)

            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, progress: progress)
            } else {
                viewModel.media!.mediaListEntry!.progress = progress
            }

            let total = viewModel.media!.type == .anime
                ? viewModel.media!.episodes
                : viewModel.media!.chapters

            if progress == 0 {
                viewModel.media!.mediaListEntry!.status = .planning
            } else if progress == total {
                viewModel.media!.mediaListEntry?.status = .completed
            } else {
                viewModel.media?.mediaListEntry?.status = .current
            }

            // If no progress has been made and no repeats have been recorded, update the start date to the current
            // date. The user won't have to update the date themselves.
            if (viewModel.media!.mediaListEntry!.progress ?? 0) == 0
                && (viewModel.media!.mediaListEntry!.repeat ?? 0) == 0 {
                let components = Calendar.current.dateComponents([.day, .month, .year], from: Date())

                viewModel.media!.mediaListEntry!.startedAt = .init(
                    year: components.year,
                    month: components.month,
                    day: components.day
                )
            }

            if viewModel.media!.mediaListEntry!.progress != nil
                && viewModel.media!.mediaListEntry!.progress! == total
                && (viewModel.media!.mediaListEntry!.repeat ?? 0) == 0 {
                let components = Calendar.current.dateComponents([.day, .month, .year], from: Date())

                viewModel.media!.mediaListEntry!.completedAt = .init(
                    year: components.year,
                    month: components.month,
                    day: components.day
                )
            }
        }

        let progressVolumesBinding = Binding {
            viewModel.media!.mediaListEntry?.progressVolumes ?? 0
        } set: { volumes in
            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, progressVolumes: volumes)
            } else {
                viewModel.media!.mediaListEntry?.progressVolumes = volumes
            }

            if volumes == 0 {
                viewModel.media!.mediaListEntry!.status = .planning
            } else if volumes == viewModel.media!.volumes {
                viewModel.media!.mediaListEntry?.status = .completed
            } else {
                viewModel.media?.mediaListEntry?.status = .current
            }
        }

        Group {
            switch viewModel.media!.type! {
                case .anime:
                    let episodesLabel = viewModel.media!.episodes == nil
                        ? "Episodes: \(Int(progressBinding.wrappedValue))"
                        : "Episodes: \(Int(progressBinding.wrappedValue))/\(viewModel.media!.episodes!)"

                    Stepper(episodesLabel,
                            value: progressBinding,
                            in: 0...Double(viewModel.media!.episodes ?? Int.max)
                    )

                    if let episodes = viewModel.media!.episodes {
                        Slider(value: progressBinding, in: 0...Double(episodes))
                    }
                case .manga:
                    let chaptersLabel = viewModel.media!.chapters == nil
                        ? "Chapters: \(Int(progressBinding.wrappedValue))"
                        : "Chapters: \(Int(progressBinding.wrappedValue))/\(viewModel.media!.chapters!)"

                    let volumesLabel = viewModel.media!.volumes == nil
                        ? "Volumes: \(progressVolumesBinding.wrappedValue)"
                        : "Volumes: \(progressVolumesBinding.wrappedValue)/\(viewModel.media!.volumes!)"

                    Stepper(chaptersLabel,
                            value: progressBinding,
                            in: 0...Double(viewModel.media!.chapters ?? Int.max)
                    )

                    if let chapters = viewModel.media!.chapters {
                        Slider(value: progressBinding, in: 0...Double(chapters))
                    }

                    Stepper(volumesLabel,
                            value: progressVolumesBinding,
                            in: 0...(viewModel.media!.volumes ?? Int.max)
                    )
                case .__unknown:
                    EmptyView()
            }
        }

        Stepper("\(repeatName(type: viewModel.media!.type!)): \(repeatBinding.wrappedValue)",
                value: repeatBinding,
                in: 0...Int.max)

        let startDateBinding: Binding<Date> = Binding {
            if let year = viewModel.media!.mediaListEntry?.startedAt?.year,
               let month = viewModel.media!.mediaListEntry?.startedAt?.month,
               let day = viewModel.media!.mediaListEntry?.startedAt?.day {
                return Calendar.current.date(from: DateComponents(
                    year: year,
                    month: month,
                    day: day
                ))!
            }

            return Date()
        } set: { date in
            let components = Calendar.current.dateComponents([.day, .month, . year], from: date)

            let startedAt = MediaEditorQuery.Data.Medium.MediaListEntry.StartedAt(
                year: components.year,
                month: components.month,
                day: components.day
            )

            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, startedAt: startedAt)
            } else {
                viewModel.media!.mediaListEntry!.startedAt = startedAt
            }
        }

        let completeDateBinding: Binding<Date> = Binding {
            if let year = viewModel.media!.mediaListEntry?.completedAt?.year,
               let month = viewModel.media!.mediaListEntry?.completedAt?.month,
               let day = viewModel.media!.mediaListEntry?.completedAt?.day {
                return Calendar.current.date(from: DateComponents(
                    year: year,
                    month: month,
                    day: day
                ))!
            }

            return Date()
        } set: { date in
            let components = Calendar.current.dateComponents([.day, .month, . year], from: date)

            let completedAt = MediaEditorQuery.Data.Medium.MediaListEntry.CompletedAt(
                year: components.year,
                month: components.month,
                day: components.day
            )

            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, completedAt: completedAt)
            } else {
                viewModel.media!.mediaListEntry!.completedAt = completedAt
            }
        }

        // DatePicker requires the `selection` parameter to hold Binding<Date>. This is problematic for the user,
        // because the user has the optional choice of selecting a date. We don't know when the user started or
        // finished this anime/manga, so we'll sadly have to settle for the solution of setting the current date.
        // It would be more ideal to have the field empty, then allow the user to set a value.
        DatePicker("Start Date", selection: startDateBinding, displayedComponents: [.date])
        DatePicker("Finish Date", selection: completeDateBinding, displayedComponents: [.date])

        let priorityBinding = Binding {
            viewModel.media!.mediaListEntry?.priority ?? 0
        } set: { priority in
            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, priority: priority)
            } else {
                viewModel.media!.mediaListEntry!.priority = priority
            }
        }

        Stepper("Priority: \(priorityBinding.wrappedValue)", value: priorityBinding, in: 0...Int.max)
    }

    func repeatName(type: MediaType) -> String {
        switch type {
            case .anime: return "Rewatches"
            case .manga: return "Rereads"
            case .__unknown: return "Repeats"
        }
    }
}
