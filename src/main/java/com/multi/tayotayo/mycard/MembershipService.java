package com.multi.tayotayo.mycard;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class MembershipService {

	private MembershipDAO membershipDAO;
	private CardUsehistoryDAO cardusehistoryDAO;
	private PointDAO pointDAO;

	public MembershipService(MembershipDAO membershipDAO, CardUsehistoryDAO cardusehistoryDAO, PointDAO pointDAO) {
		this.membershipDAO = membershipDAO;
		this.cardusehistoryDAO = cardusehistoryDAO;
		this.pointDAO = pointDAO;
	}

	// 멤버쉽 카드 신청
	public void saveMembershipData(MembershipVO membership) {
		try {
			membershipDAO.saveMembership(membership);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 멤버쉽 카드 목록 불러오기
	public List<MembershipVO> getMembershipList(String c_memberid) {
		try {
			return membershipDAO.getMembershipList(c_memberid);
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	// 멤버쉽 카드 상세 정보 불러오기
	public MembershipVO getMembershipCardDetails(String cardNum) {
		try {
			return membershipDAO.getMembershipCardDetails(cardNum);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 멤버쉽 카드 충전
	public void updateCardNewBalance(String cardNum, int newBalance, int newPoint) {
		try {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("cardNum", cardNum);
			paramMap.put("newBalance", newBalance);
			paramMap.put("newPoint", newPoint);

			membershipDAO.updateCardNewBalance(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("충전 실패: " + e.getMessage());
		}
	}

	// 멤버쉽 카드 리스트 불러오기 (이용내역 조회용)
	public List<MembershipVO> getMembershipCardListForBillSearch(String c_memberid) {
		try {
			return membershipDAO.getMembershipList(c_memberid);
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	// 멤버쉽 카드 충전소 결제
	public void updateCardSubtract(String cardNum, int chargeAmountInput, int pointInput, double chargingTime,
			float chargingAmount, String statId, String es_statNm) {
		try {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("cardNum", cardNum);
			paramMap.put("chargeAmountInput", chargeAmountInput);
			paramMap.put("pointInput", pointInput);
			paramMap.put("chargingTime", chargingTime);
			paramMap.put("chargingAmount", chargingAmount);
			paramMap.put("statId", statId);
			paramMap.put("es_statNm", es_statNm);

			membershipDAO.updateCardSubtract(paramMap);

			cardusehistoryDAO.processPayment(paramMap);

			pointDAO.insertPoint(paramMap);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("충전 실패: " + e.getMessage());
		}
	}

	// 멤버십 카드 불러오기 (결제)
	public MembershipVO getMembershipCardInfo(String cardNum) {
		try {
			return membershipDAO.getMembershipCardInfo(cardNum);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 멤버쉽 카드 존재 여부 확인
	public boolean checkMembershipCardExistence(String c_memberid) {
		try {
			return membershipDAO.checkMembershipCardExistence(c_memberid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("멤버십 카드 존재 여부 확인 중 오류 발생: " + e.getMessage());
		}
	}

}
