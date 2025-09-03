package registrar;

import java.util.HashSet;


/*
 * The Courses class is a class that assists the Registrar class. This class
 * creates the courses that are stored in the Registrar. The courses class
 * also stores all students taking the a course as a HashSet and has 
 * methods that compare courses, adds students to courses, and checking 
 * if a student is in a course.
 */
public class Courses {
	
 // Declares all fields for the classs
	private String department;
	private int number;
	private int numSeats;
	private HashSet<String> studentsInCourse; // stores students for courses



/* This is the course constructor. it passes the department, number and 
 * numSeates from the addCourse method in the Registrar and creates the course
 * it also creates a new HashSet for the students in course.
 */
	public Courses(String department, int number, int numSeats) {
		this.department = department;
		this.number = number;
		this.numSeats = numSeats;
		studentsInCourse = new HashSet<String>();
	}


	
/*
 * This method checks if a course exists by checking for courses with the same 
 * department and course number. it returns true if the course already exists 
 * and false if it does not
 */
	public boolean courseExist(String courseName, int courseNumber) {
		return department.equals(courseName)&&number==courseNumber;
	}

	
	
/*
 * This method adds the student specified to the students HashSet. 
 * If the amount of students in the course is equal the amount of 
 * numseats for the course then that student is not added 
 * to the class. also, if the student is already in the class then that 
 * student is not added. returns true if student is added and false if 
 * student is not added to the course.
 */
	public boolean addToClass(String firstName, String lastName) {
	
	//Initialize variables 
		boolean output = false;
		
	//If no one is in the course, just add them without checking
		if(studentsInCourse.size()==0) {
			output = studentsInCourse.add(firstName+lastName);
			
	// As long as the students is less than the seats available add them 
		}else if(studentsInCourse.size()<numSeats) {
			output = studentsInCourse.add(firstName+lastName);
		}
		
		return output;
	}

	
	
// this method returns the amount of students in the course
	public int amountOfStudents() {
		return studentsInCourse.size();
	}
	
	
	
/*
 * This method checks for the amount of students with the same lastName
 * in the course and returns that amount
 */
	public int sameLastName(String lastName) {
		
	// Initialize variable
		int output = 0;
	
	//Loop to check for same last name in the student HasSet
		for(String name: studentsInCourse) {
			if(name.endsWith(lastName)) {
				output++;
			}
		}
		
		return output;
	}

	
	
/*
 * This method checks if the student is in the course.
 * It returns false if it does not find the student and true if does.
 */
	public boolean isInClass(String firstName, String lastName) {
		return studentsInCourse.contains(firstName+lastName);
	}
	
	
	
/*
 * This method removes the student specified from the course and return 
 * true. if the student is not in the course, return false.
 */
	public boolean removeStudent(String firstName, String lastName) {
		return studentsInCourse.remove(firstName+lastName);
	}

}
