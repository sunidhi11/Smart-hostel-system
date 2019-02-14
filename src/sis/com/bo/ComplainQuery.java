package sis.com.bo;

import java.util.*;

public class ComplainQuery {
	private long queryId;
	private long parentId;
	private Date date;
	private String subject;
	private String complain;
	private String category;
	private long sourceId;
	private long destinationId;
	private String  message;
	private String seen;
	private String deletedForSource;
	private String deletedForDestination;
	private long id;
	private String email;
	
	public long getQueryId() {
		return queryId;
	}
	public void setQueryId(long queryId) {
		this.queryId = queryId;
	}
	public long getParentId() {
		return parentId;
	}
	public void setParentId(long parentId) {
		this.parentId = parentId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getComplain() {
		return complain;
	}
	public void setComplain(String complain) {
		this.complain = complain;
	}
	public long getSourceId() {
		return sourceId;
	}
	public void setSourceId(long sourceId) {
		this.sourceId = sourceId;
	}
	public long getDestinationId() {
		return destinationId;
	}
	public void setDestinationId(long destinationId) {
		this.destinationId = destinationId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSeen() {
		return seen;
	}
	public void setSeen(String seen) {
		this.seen = seen;
	}
	public String getDeletedForSource() {
		return deletedForSource;
	}
	public void setDeletedForSource(String deletedForSource) {
		this.deletedForSource = deletedForSource;
	}
	public String getDeletedForDestination() {
		return deletedForDestination;
	}
	public void setDeletedForDestination(String deletedForDestination) {
		this.deletedForDestination = deletedForDestination;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
