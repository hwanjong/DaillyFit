package bean;

import java.io.Serializable;

public class User implements Serializable{
	
	String userId;
	String pw;
	String nicname;
	String gender;
	int age;
	int height;
	int weight;
	int targetWeight;
	String targetPower;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getTargetWeight() {
		return targetWeight;
	}
	public void setTargetWeight(int targetWeight) {
		this.targetWeight = targetWeight;
	}
	public String getTargetPower() {
		return targetPower;
	}
	public void setTargetPower(String targetPower) {
		this.targetPower = targetPower;
	}
	

}
