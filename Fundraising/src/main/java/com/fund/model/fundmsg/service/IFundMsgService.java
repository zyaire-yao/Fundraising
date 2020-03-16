package com.fund.model.fundmsg.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundMsg;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.Msg;
import com.fund.model.eneity.Store;

public interface IFundMsgService {

	void addFundMsg(FundMsg fundMsg, Member member, Integer fundProductId, Store storeId);

	String addMsgPic(MultipartFile file, HttpServletRequest request);

	List<FundMsg> listFindFundMsgByFundProductId(Integer fundProductId);

	List<FundMsg> findAllFundMsgByStoreId(Integer storeId);


}
