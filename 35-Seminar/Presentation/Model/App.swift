//
//  App.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit

struct App {
    let iconImage: UIImage
    let ranking: Int
    let title: String
    let subTitle: String? // 없을 경우 카테고리명을 표기함
    let category: AppCategory
    let downloadState: DownloadState
    let price: Int
    
    // Mock Data
    static let freeApps: [App] = [
        App(
            iconImage: .silson24,
            ranking: 1,
            title: "실손24",
            subTitle: "간편한 실손보험 청구",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .onetwo,
            ranking: 2,
            title: "한투-한국투자증권,MTS,투자,증권,해외주식,주식",
            subTitle: "한국투자:대방,공모주,펀드,연금,",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .naverpay,
            ranking: 3,
            title: "네이버페이",
            subTitle: "지갑 없이 매장에서 결제",
            category: .finance,
            downloadState: .update,
            price: 0
        ),
        App(
            iconImage: .kakaopay,
            ranking: 4,
            title: "카카오페이",
            subTitle: "마음 놓고 금융하다",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .kbpay,
            ranking: 5,
            title: "KB Pay",
            subTitle: "모든 금융을 한번에, 한손에, 한눈에 담다",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .monimo,
            ranking: 6,
            title: "monimo (모니모, 삼성금융네트웍스)",
            subTitle: "모이는 금융, 커지는 혜택!",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .kbstarbank,
            ranking: 7,
            title: "KB스타뱅킹",
            subTitle: "모바일신분증, 결제, 통신도 다 되는 은행",
            category: .finance,
            downloadState: .reDownload,
            price: 0
        ),
        App(
            iconImage: .travelwallet,
            ranking: 8,
            title: "트래블월렛 - travel Pay",
            subTitle: "페이에 세계를 담다",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .namu,
            ranking: 9,
            title: "나무증권 - NH투자증권 MTS",
            subTitle: "쉽고 편한 국내주식, 해외주식",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .toss,
            ranking: 10,
            title: "토스",
            subTitle: "금융이 쉬워진다",
            category: .finance,
            downloadState: .downloaded,
            price: 0
        ),
        App(
            iconImage: .kakaobank,
            ranking: 11,
            title: "카카오뱅크",
            subTitle: "이미 모두의 은행",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .solbank,
            ranking: 12,
            title: "신한 SOL 뱅크 - 신한은행 스마트폰뱅킹",
            subTitle: nil,
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .nhbank,
            ranking: 13,
            title: "NH올원뱅크",
            subTitle: nil,
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .hanabank,
            ranking: 14,
            title: "하나은행, 하나원큐는 돈기운 가득한 은행 앱",
            subTitle: "송금, 해외송금, 유학생송금",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .kbank,
            ranking: 15,
            title: "케이뱅크 (Kbank)",
            subTitle: "make money",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .v3,
            ranking: 16,
            title: "V3 Mobile Plus",
            subTitle: "코스콤 통합인증 / 알림창 메시지 서비스",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .mobileTmoney,
            ranking: 17,
            title: "모바일티머니",
            subTitle: nil,
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .hyundaicard,
            ranking: 18,
            title: "현대카드",
            subTitle: nil,
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .solpay,
            ranking: 19,
            title: "신한 SOL페이 - 신한카드 대표플랫폼",
            subTitle: "결제부터 자산관리, 다양한 금융",
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        App(
            iconImage: .hyundaidepartment,
            ranking: 20,
            title: "현대백화점",
            subTitle: nil,
            category: .finance,
            downloadState: .download,
            price: 0
        ),
        
    ]
    
}
