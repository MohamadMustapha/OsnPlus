//
//  SeriesGenres.swift
//
//
//  Created by Mohamad Mustapha on 19/06/2024.
//

import Foundation

enum SeriesGenres: Int {
  case actionAdventure = 10759
  case animation = 16
  case comedy = 35
  case crime = 80
  case documentary = 99
  case drama = 18
  case family = 10751
  case kids = 10762
  case mystery = 9648
  case news = 10763
  case reality = 10764
  case sciFiFantasy = 10765
  case soapOpera = 10766
  case talk = 10767
  case warPolitics = 10768
  case western = 37

  var title: String {
    switch self {
    case .actionAdventure:
      return "Action & Adventure"
    case .animation:
      return "Animation"
    case .comedy:
      return "Comedy"
    case .crime:
      return "Crime"
    case .documentary:
      return "Documentary"
    case .drama:
      return "Drama"
    case .family:
      return "Family"
    case .kids:
      return "Kids"
    case .mystery:
      return "Mystery"
    case .news:
      return "News"
    case .reality:
      return "Reality"
    case .sciFiFantasy:
      return "Sci-Fi & Fantasy"
    case .soapOpera:
      return "Soap Opera"
    case .talk:
      return "Talk"
    case .warPolitics:
      return "War & Politics"
    case .western:
      return "Western"
    }
  }
}
