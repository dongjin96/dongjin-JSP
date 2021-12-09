package dto;

public class Plike {

	private int plike_num;
	private int p_num;
	private int m_num;
	
	
	public Plike() {}


	public Plike(int plike_num, int p_num, int m_num) {
		super();
		this.plike_num = plike_num;
		this.p_num = p_num;
		this.m_num = m_num;
	}
	public Plike(int p_num, int m_num) {
		this.p_num = p_num;
		this.m_num = m_num;
	}


	public int getPlike_num() {
		return plike_num;
	}


	public void setPlike_num(int plike_num) {
		this.plike_num = plike_num;
	}


	public int getP_num() {
		return p_num;
	}


	public void setP_num(int p_num) {
		this.p_num = p_num;
	}


	public int getM_num() {
		return m_num;
	}


	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
	
	
}
