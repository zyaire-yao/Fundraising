package com.fund.model.fundreply.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundReply;
import com.fund.model.eneity.Store;

public interface IFundReplyService {

	void addFundReply(FundReply fundReply, Store getStore, Integer fundMsgId, Integer fundProductId);

	String addReplyPic(MultipartFile file, HttpServletRequest request);

	List<FundReply> findAllFundReplyByStoreId(Integer storeId);

	List<FundReply> listFindFundReplyByFundProductId(Integer fundProductId);

}
