package funding.dto;

public class NoticeFile {
	private int fileNo;
	private int noticeNo;
	private String fileOrigin;
	private String fileStorage;

	@Override
	public String toString() {
		return "NoticeFile [fileNo=" + fileNo + ", noticeNo=" + noticeNo + ", fileOrigin=" + fileOrigin
				+ ", fileStorage=" + fileStorage + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileOrigin() {
		return fileOrigin;
	}

	public void setFileOrigin(String fileOrigin) {
		this.fileOrigin = fileOrigin;
	}

	public String getFileStorage() {
		return fileStorage;
	}

	public void setFileStorage(String fileStorage) {
		this.fileStorage = fileStorage;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
}
