//
//  DownloadState.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit

enum DownloadState: String {
  case download
  case reDownload
  case downloaded
  case update

  var title: String? {
    switch self {
    case .download:
      "받기"
    case .reDownload:
      nil
    case .downloaded:
      "열기"
    case .update:
      "업데이트"
    }
  }

  var image: UIImage? {
    self == .reDownload ? UIImage(systemName: "icloud.and.arrow.down") : nil
  }
    
}
