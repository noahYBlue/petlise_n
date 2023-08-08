package admin.board;

import java.util.Date;

public class AdminCommentReportResponseDTO {
	int count;
	String report_id, board_id, comment_id, report_type, comment_contents, comment_writer, comment_reporter;
	Date report_date, comment_created_at;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getReport_type() {
		return report_type;
	}
	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}
	public String getComment_contents() {
		return comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}
	public String getComment_writer() {
		return comment_writer;
	}
	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}
	public String getComment_reporter() {
		return comment_reporter;
	}
	public void setComment_reporter(String comment_reporter) {
		this.comment_reporter = comment_reporter;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	public Date getCreated_at() {
		return comment_created_at;
	}
	public void setCreated_at(Date comment_created_at) {
		this.comment_created_at = comment_created_at;
	}

}
