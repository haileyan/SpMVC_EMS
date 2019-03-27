package com.biz.email.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.email.model.EmailVO;

public interface EmailDao {

	@Select("SELECT * FROM tbl_emails")
	public List<EmailVO> selectAll();
	
	@Select("SELECT * FROM tbl_emails WHERE id=${id}")
	public EmailVO findById(long id);
	
	@Select("SELECT * FROM tbl_emails WHERE from_email=#{from_email}")
	public List<EmailVO> findByFrom(String from_email);
		
	@InsertProvider(type=EmailSQL.class, method="email_insert_sql")
	public int insert(EmailVO emailVO);
	
	@UpdateProvider(type=EmailSQL.class, method="email_update_sql")
	public int update(EmailVO emailVO);
	
	@Delete("DELETE FROM tbl_emails WHERE from_email=#{from_email}")
	public void delete();
	
}
