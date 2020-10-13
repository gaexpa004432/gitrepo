package teamProject3.member.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import teamProject3.member.MemberVO;

public interface MemberDAO {

	//전체조회
	ArrayList<MemberVO> selectAll(MemberVO memberVO);

	//한건조회
	MemberVO selectOne(MemberVO memberVO);

	//소상공인 한건조회
	MemberVO selectOneAdd(MemberVO memberVO);

	//삭제
	void delete(MemberVO memberVO);

	//seller_code만 수정
	int updateSellerCode(MemberVO memberVO);

	//member_email만 수정
	int updateMemberEmail(MemberVO memberVO);

	//수정
	int update(MemberVO memberVO);

	//등록
	int insert(MemberVO memberVO);

	//판매자 아이디 가져오기
	MemberVO selectSellerId(MemberVO memberVO);

	void updateMileage(MemberVO memberVO);

}