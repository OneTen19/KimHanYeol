//
//  DownloadState.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

enum DownloadState {
  case download // 한 번도 다운받지 않은 상태
  case reDownload // 다운받았다가 삭제한 상태
  case update // 업데이트
}
