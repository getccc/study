/**
 * 学生类
 * @author CaiJianWei
 *
 * 2017-12-26
 */
public class Student {
	private String sid;
	private String name;
	private String gender;
	private int age;
	
	public Student (){
		
	}
	
	public Student(String sid, String name, String gender, int age) {
		this.sid = sid;
		this.name = name;
		this.gender = gender;
		this.age = age;
	}

	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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

	@Override
	public String toString() {
		return "Student [age=" + age + ", gender=" + gender + ", name=" + name
				+ ", sid=" + sid + "]";
	}
	
	
}
