package teamProject3.member.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject3.member.MemberVO;
import teamProject3.member.mapper.MemberDAO;
import teamProject3.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired MemberDAO memberDAO;
	
	@Override
	public ArrayList<MemberVO> selectAll(MemberVO memberVO) {
		
		return memberDAO.selectAll(memberVO);
	}

	@Override
	public MemberVO selectOne(MemberVO memberVO) {
		
		return memberDAO.selectOne(memberVO);
	}

	@Override
	public MemberVO selectOneAdd(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(MemberVO memberVO) {
		memberDAO.delete(memberVO);
		
	}

	@Override
	public int updateSellerCode(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMemberEmail(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MemberVO memberVO) {
		memberDAO.update(memberVO);
		return 0;
	}

	@Override
	public int insert(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO selectSellerId(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMileage(MemberVO memberVO) {
		memberDAO.updateMileage(memberVO);
		
	}

}
