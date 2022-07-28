package Tigers.api.test.review.data;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;

public class dataGenerator {
	
	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName() + faker.name().lastName() + "@gmail.com";
	}
	
	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();
	}
	
	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
	}
	
	public static String getJob() {
		Faker faker = new Faker();
		return faker.job().title();
	}
	
	public static String getDob() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyy-mm-dd");
		return format.format(date);
	}
	
	public static String getStreetNumber() {
		Faker faker = new Faker();
		return faker.address().streetAddressNumber();
	}
	
	public static String getStreetAddress() {
		Faker faker = new Faker();
		return getStreetNumber().concat(faker.address().streetAddress());
		
	}
	
	public static String getCityName() {
		Faker faker = new Faker();
		return faker.address().cityName();
	}
	
	public static String getState() {
		Faker faker = new Faker();
		return faker.address().stateAbbr();
	}
	
	public static String  getZipCode() {
		Faker faker = new Faker();
		return faker.address().zipCode();
	}
	
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().phoneNumber();
	}
	
	public static String getExtension() {
		Faker faker = new Faker();
		return faker.phoneNumber().extension();
	}
	
	
}
