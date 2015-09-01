package bean;

import java.io.Serializable;

public class User implements Serializable{
	
	String userId;
	String pw;
	String nicName;
	String gender;
	String age;
	String height;
	String weight;
	String targetWeight;
	String targetPower;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNicName() {
		return nicName;
	}
	public void setNicName(String nicName) {
		this.nicName = nicName;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getTargetWeight() {
		return targetWeight;
	}
	public void setTargetWeight(String targetWeight) {
		this.targetWeight = targetWeight;
	}
	public String getTargetPower() {
		return targetPower;
	}
	public void setTargetPower(String targetPower) {
		this.targetPower = targetPower;
	}

}
