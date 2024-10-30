//
//  TossReview.swift
//  35-Seminar
//
//  Created by OneTen on 10/31/24.
//

import UIKit

struct TossReview {
    let customerReviewViewTitle: String
    let customerReviewViewDateLabel: String
    let customerNameLabel: String
    let customerReviewLabel: String
    let developerReviewViewTitle: String
    let developerReviewViewDateLabel: String
    let developerReviewLabel: String
    
    static let TossReviewMockData: [TossReview] = [
        TossReview(
            customerReviewViewTitle: "토스 UX 전버전으로 해주세요",
            customerReviewViewDateLabel: "9월 27일",
            customerNameLabel: "흑 운영자님 ㅠㅠ",
            customerReviewLabel: "최근 업데이트가 토스만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트로 인해 딱딱해진것 같네요. 새로움을 지향하는건 좋으나 이용자들에게 강제가 아닌 선택할 수 있는 옵션이라도 만들어 주셨으면 어떨까요?",
            developerReviewViewTitle: "개발자 답변",
            developerReviewViewDateLabel: "9월 29일",
            developerReviewLabel: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 요구를 반영해 조금 더 편리하게 사용하도록 변경하였습니다만, 고객님처럼 불편하게 느끼셨을수도 있다고 생각합니다. 사용에 불편을 드려 죄송합니다." + "고객님께서 말씀해주신 내용은 반영될 수 있다 확답 드리기는 어려우나, 팀내에 공유하여 보다 편리한 토스 사용 경험을 하실 수 있도록 노력하겠습니다. 다른 문의 사항이 있다면 24시간 운영되는 카카오톡(@toss) 또는 고객센터 1599-4905로 문의 부탁드립니다. 감사합니다."
        ),
        TossReview(
            customerReviewViewTitle: "토스 UX 전버전으로 해주세요",
            customerReviewViewDateLabel: "9월 27일",
            customerNameLabel: "흑 운영자님 ㅠㅠ",
            customerReviewLabel: "최근 업데이트가 토스만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트로 인해 딱딱해진것 같네요. 새로움을 지향하는건 좋으나 이용자들에게 강제가 아닌 선택할 수 있는 옵션이라도 만들어 주셨으면 어떨까요?",
            developerReviewViewTitle: "개발자 답변",
            developerReviewViewDateLabel: "9월 29일",
            developerReviewLabel: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 요구를 반영해 조금 더 편리하게 사용하도록 변경하였습니다만, 고객님처럼 불편하게 느끼셨을수도 있다고 생각합니다. 사용에 불편을 드려 죄송합니다." + "고객님께서 말씀해주신 내용은 반영될 수 있다 확답 드리기는 어려우나, 팀내에 공유하여 보다 편리한 토스 사용 경험을 하실 수 있도록 노력하겠습니다. 다른 문의 사항이 있다면 24시간 운영되는 카카오톡(@toss) 또는 고객센터 1599-4905로 문의 부탁드립니다. 감사합니다."
        ),
        TossReview(
            customerReviewViewTitle: "토스 UX 전버전으로 해주세요",
            customerReviewViewDateLabel: "9월 27일",
            customerNameLabel: "흑 운영자님 ㅠㅠ",
            customerReviewLabel: "최근 업데이트가 토스만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트로 인해 딱딱해진것 같네요. 새로움을 지향하는건 좋으나 이용자들에게 강제가 아닌 선택할 수 있는 옵션이라도 만들어 주셨으면 어떨까요?",
            developerReviewViewTitle: "개발자 답변",
            developerReviewViewDateLabel: "9월 29일",
            developerReviewLabel: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 요구를 반영해 조금 더 편리하게 사용하도록 변경하였습니다만, 고객님처럼 불편하게 느끼셨을수도 있다고 생각합니다. 사용에 불편을 드려 죄송합니다." + "고객님께서 말씀해주신 내용은 반영될 수 있다 확답 드리기는 어려우나, 팀내에 공유하여 보다 편리한 토스 사용 경험을 하실 수 있도록 노력하겠습니다. 다른 문의 사항이 있다면 24시간 운영되는 카카오톡(@toss) 또는 고객센터 1599-4905로 문의 부탁드립니다. 감사합니다."
        ),
        TossReview(
            customerReviewViewTitle: "토스 UX 전버전으로 해주세요",
            customerReviewViewDateLabel: "9월 27일",
            customerNameLabel: "흑 운영자님 ㅠㅠ",
            customerReviewLabel: "최근 업데이트가 토스만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트로 인해 딱딱해진것 같네요. 새로움을 지향하는건 좋으나 이용자들에게 강제가 아닌 선택할 수 있는 옵션이라도 만들어 주셨으면 어떨까요?",
            developerReviewViewTitle: "개발자 답변",
            developerReviewViewDateLabel: "9월 29일",
            developerReviewLabel: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 요구를 반영해 조금 더 편리하게 사용하도록 변경하였습니다만, 고객님처럼 불편하게 느끼셨을수도 있다고 생각합니다. 사용에 불편을 드려 죄송합니다." + "고객님께서 말씀해주신 내용은 반영될 수 있다 확답 드리기는 어려우나, 팀내에 공유하여 보다 편리한 토스 사용 경험을 하실 수 있도록 노력하겠습니다. 다른 문의 사항이 있다면 24시간 운영되는 카카오톡(@toss) 또는 고객센터 1599-4905로 문의 부탁드립니다. 감사합니다."
        ),
        TossReview(
            customerReviewViewTitle: "토스 UX 전버전으로 해주세요",
            customerReviewViewDateLabel: "9월 27일",
            customerNameLabel: "흑 운영자님 ㅠㅠ",
            customerReviewLabel: "최근 업데이트가 토스만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트로 인해 딱딱해진것 같네요. 새로움을 지향하는건 좋으나 이용자들에게 강제가 아닌 선택할 수 있는 옵션이라도 만들어 주셨으면 어떨까요?",
            developerReviewViewTitle: "개발자 답변",
            developerReviewViewDateLabel: "9월 29일",
            developerReviewLabel: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 요구를 반영해 조금 더 편리하게 사용하도록 변경하였습니다만, 고객님처럼 불편하게 느끼셨을수도 있다고 생각합니다. 사용에 불편을 드려 죄송합니다." + "고객님께서 말씀해주신 내용은 반영될 수 있다 확답 드리기는 어려우나, 팀내에 공유하여 보다 편리한 토스 사용 경험을 하실 수 있도록 노력하겠습니다. 다른 문의 사항이 있다면 24시간 운영되는 카카오톡(@toss) 또는 고객센터 1599-4905로 문의 부탁드립니다. 감사합니다."
        )
    ]
}
