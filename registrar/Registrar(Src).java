package registrar;
import java.io.BufferedReader;

import java.io.FileReader;
import java.util.Collection;
import java.util.HashSet;

/*
 * The Registrar class is a class that simulates a registration system
 * used by schools. It stores all courses in a HashSet and can manipulate 
 * its elements with methods that can create courses, delete them and 
 * add students to courses. This class implements the Runnable interface 
 * and can only create new courses or add students to courses concurrently
 * from reading from a text file.
 * The methods in this class throws an IllegalArgumentException if 
 * any String parameter is null or an empty string or if the int
 * parameter is <= 0
 */
public class Registrar implements Runnable {
	private HashSet<Courses> courses;
	
	private static int maxClasses;
	
	private static String[] files;

	
	
/*
 * The Registrar constructor takes in an integer field to pass
 * as the max classes that each student can take. If any number less than 
 * 1 is passed as the parameter, the constructor treats it as 1 was passed 
 * instead.
 */
	public Registrar(int maxCoursesPerStudent) {
		
		maxClasses = maxCoursesPerStudent;
		courses = new HashSet<>();
		
	// changes the maxClasses if an invalid number is inputed
		if(maxCoursesPerStudent<=0) {
			maxClasses = 1;
		}
	}

	
	
/* This method adds a course to the courses field if it does 
 * not already have the course and both the course number and 
 * number of seats are greater than 0. if the course already 
 * exists, it does nothing. the method throws an IllegalArgument Exception
 * if any string value is null or empty or an integer parameter is 
 * less than or equal to 0. The method returns the current object
 */
	public synchronized Registrar addNewCourse(String department, int number,
			int numSeats) throws IllegalArgumentException {
	
	// throws exception if conditions arent met
		if(department==null||department.equals("")||number<=0||numSeats<=0) {
			throw new IllegalArgumentException();
		}
		
		int sameCourse = 0;
		
	// if size is 0 just add the new course to the set 
		if(courses.size()==0) {
			Courses courseName = new Courses(department,number,numSeats);
			courses.add(courseName);
	
	// goes through set looking for duplicate courses 
		} else {
			for(Courses course:courses) {
				
			// if there are increment the variable by 1
				if(course.courseExist(department, number)){
					sameCourse++;
				}
			}
			
		// if no same course is found, create the course and add it
			if(sameCourse==0) {
				Courses courseName = new Courses(department,number,numSeats);
				courses.add(courseName);
			}
		}
		
		return this; //returns the object that calls it
	}

	
	
/*
 * this method removes a course from the Registrar. if the course does not  
 * exist, it returns false but if it does, it removes the course and 
 * returns true the method throws an IllegalArgumentException
 * if any string value is null or empty or an integer parameter is 
 * less than or equal to 0.
 */
	public boolean cancelCourse(String department, int number) 
			throws IllegalArgumentException{
	
	//throws exception if conditions arent met
		if (department.equals("")||department==null||number<=0) {
			throw new IllegalArgumentException();
		}
		
	// variables declared and initialized 
		boolean output = false;
		
		Courses remove=null;
		
	// checks the classes to find the one we want to remove 
		for(Courses course:courses) {
			if(course.courseExist(department, number)) {
			// changes remove variable if we find the course
				remove = course;
				output = true;
			}
		}
		
	// removes the course
		courses.remove(remove);
		
		return output;
	}

	
	
/*
 * This method checks and returns the amount of courses in the 
 * Registrar
 */
	public int numCourses() {
		return courses.size();
	}


	
/*
 * This method adds a student to a course in the Registrar. 
 * A student can only  be added if that student is taking less 
 * than maxClasses allowed, if that student is not already in that course 
 * and if the course itself exists. The method returns 
 * false if the student wasnt able to be added to the class and true if
 * they are added. The method throws an IllegalArgumentException if 
 * any String parameter is null or an empty string or if the int 
 * parameter is <= 0
 */
	public synchronized boolean addToCourse(String department, int number,
		String firstName, String lastName) throws IllegalArgumentException {
	
	//throws exception if conditions arent met
		if(department.equals("")||department==null||number<=0||
				firstName==null||firstName.equals("")||
				lastName.equals("")||lastName==null) {
			throw new IllegalArgumentException();
		}
		
	// variables declared and initialized 
		boolean output = false;
		int classesTaken = 0;

	// loop checks amount of courses the student is taking
		for(Courses course:courses) {
			if(course.isInClass(firstName,lastName)) {
				classesTaken++;
			}
		}

	//if course exists and student not taking maxClasses, add student 
		//to class
		for(Courses course:courses) {
			if(course.courseExist(department, number)&&
					classesTaken<maxClasses) {
				output = course.addToClass(firstName, lastName);
			}
		}
		
		return output;
	}

	
	
/*
 * This method checks the amount of Students in the required course and 
 * returns that number. if the course does not exist, -1 is returned 
 * instead. The method throws an IllegalArgumentException if 
 * any String parameter is null or an empty string or if the int
 * parameter is <= 0
 */
	public int numStudentsInCourse(String department, int number) 
			throws IllegalArgumentException {
		
	//throws exception if conditions arent met
		if(department.equals("")||department==null||number<=0) {
			throw new IllegalArgumentException();
		}
	
	//Initializes variables 
		int output = -1;
	
	//loop to check if the course exists and changes variable
		for(Courses course:courses) {
			if(course.courseExist(department, number)) {
			
			//changes variable if course exists
				output = course.amountOfStudents();
			}
		}
		
		return output;
	}

	
	
/*
 * This method checks if students in a course have the same last name and
 * returns the amount. If a course does not exist, return −1
 * The method throws an IllegalArgumentException if any String 
 * parameter is null or an empty string or if the int
 * parameter is <= 0
 */
	public int numStudentsInCourseWithLastName(String department, int number,
			String lastName) throws IllegalArgumentException {
		
	//throws exception if conditions arent met
		if(department.equals("")||department==null||number<=0||
				lastName.equals("")||lastName==null) {
			throw new IllegalArgumentException();
		}
		
	//Initializes variables
		int output = -1;
		
	//loop to check if the course exists and changes variable
		for(Courses course:courses) {
			if(course.courseExist(department, number)) {
				
			//changes the variable to amount found 
				output=course.sameLastName(lastName);
			}
		}
		
		return output;
	}

	
	
/*
 * this method checks if a person is in the course required. 
 * if the course does not exist or the person is 
 * not in that course it returns false, if the person is found in
 * that course, return true. 
 * The method throws an IllegalArgumentException if any String 
 * parameter is null or an empty string or if the int
 * parameter is <= 0
 */
	public boolean isInCourse(String department, int number, String firstName,
			String lastName) throws IllegalArgumentException {
		
	//throws exception if conditions arent met
		if(department.equals("")||department==null||number<=0||
				firstName==null||firstName.equals("")||
				lastName.equals("")||lastName==null) {
			throw new IllegalArgumentException();
		}
		
	// Initializes variable 
		boolean output = false;
		
	//loop to check if the course exists and changes variable
		for(Courses course:courses) {
			if(course.courseExist(department, number)) {
				
			// changes variable depending on if student is in class
				output = course.isInClass(firstName, lastName);
			}
		}
		return output;
	}

	
	
/*
 * This method goes through the courses array and checks for the student
 * required and counts how many classes they are in. the method returns the
 * amount of classes that student is in.
 * The method throws an IllegalArgumentException if any String 
 * parameter is null or an empty string or if the int
 * parameter is <= 0
 */
	public int howManyCoursesTaking(String firstName, String lastName) 
			throws IllegalArgumentException{
		
	//throws exception if conditions arent met
		if(firstName.equals("")||firstName==null||lastName.equals("")
				||lastName==null) {
			throw new IllegalArgumentException();
		}
		
	// Initializes variable
		int output = 0;
		
	//loop to check if the course exists and changes variable
		for(Courses course:courses) {
			
		//changes variable depending on amount of courses student is taking
			if(course.isInClass(firstName, lastName)) {
				output++;
			}
		}
		
		return output;
	}

	
	
/*
 * This method looks for a specific student in a course and removes 
 * them from that course. If the course or the student does 
 * not exist the method returns false but returns true if its successful.
 * The method throws an IllegalArgumentException if any String 
 * parameter is null or an empty string or if the int
 * parameter is <= 0
 */
	public boolean dropCourse(String department, int number, String firstName,
			String lastName)throws IllegalArgumentException {
		
	//throws exception if conditions arent met
		if(department.equals("")||department==null||number<=0||
				firstName==null||firstName.equals("")||
				lastName.equals("")||lastName==null) {
			throw new IllegalArgumentException();
		}
		
	//Initialize variables 
		boolean output = false;
		
	//loop to check find the course required to be dropped from
		for(Courses course:courses) {
			
		// checks if thats the course needed and if student is in course
			if(course.courseExist(department, number)&&
					course.isInClass(firstName, lastName)) {
				output = course.removeStudent(firstName, lastName);
			}
		}
		
		return output;
	}

	
	
/*
 * This method looks for a student and removes them from all 
 * courses they are enrolled in. 
 * if a student is not in any of the courses, return false otherwise 
 * return true if the method successfully removes the student
 * The method throws an IllegalArgumentException if any String 
 * parameter is null or an empty string or if the int
 * parameter is <= 0
 */
	public boolean cancelRegistration(String firstName, String lastName) 
			throws IllegalArgumentException {
	
	//throws exception if conditions arent met
		if(firstName.equals("")||firstName==null||lastName.equals("")
				||lastName==null) {
			throw new IllegalArgumentException();
		}
		
	// Initializes variables 
		boolean output = false;
	
	// loop to check for student 
		for(Courses course: courses) {
			
		// If required student is in that course removes them from it
			if(course.isInClass(firstName, lastName)) {
				output = 
						course.removeStudent(firstName, lastName);
			}
		}
		
		return output;
	}

	
	
/*
 * This method reads a collection of strings and checks for corresponding 
 * file names creating a thread for each element in the collection and 
 * reads them and runs the threads to their corresponding element.
 * The method throws an IllegalArgumentException if the parameter is given
 * a null argument 
 */
	public void doRegistrations(Collection<String> filenames) 
			throws IllegalArgumentException {
		
	//throws exception if conditions arent met
		if(filenames==null) {
			throw new IllegalArgumentException();
		}
		
	// creates array of threads using the size of the collection
		Thread[] allThreads = new Thread[filenames.size()];
	
	//creates an array of strings for the contents of the collection
		String[] data = new String[filenames.size()];
		
		int z =0;
		
	//copies all elements in filenames to the creates String array
		for(String name:filenames) {
			data[z] = name;
			z++;
		}
		
	// sets the static field variable to the String array created 
		files = data;
		
	//creates and stores all threads 
		for(int i=0; i<allThreads.length;i++) {
			allThreads[i] = new Thread(this);
		}
	
	// starts all threads in the thread array
		for(Thread thread: allThreads) {
			thread.start();
		}
		
	// makes sure all threads finish running before the main thread continues
		try {
			for(Thread thread: allThreads) {
				thread.join();
			}
		}catch (InterruptedException e) {
			e.printStackTrace();;
		}
	}
	
	
	
/*
 * This method is the method that tells the threads what they should do.
 * This method makes each thread read their corresponding file and process
 * the data written in the files. 
 */
	public void run() {

	//Initializes the variables that each thread should have 
		String line,name="";
		
		String[] nfiles;
		
		try {
		//locks how the threads access their corresponding file names
			synchronized(files){
			// sets their name to the first element in the list
				name = files[0];
				
			//creates a new String array that is one less than 
				//the files field
				nfiles = new String[files.length-1];
				
			//copies all elements to the creates array except the first one
				for(int i =0;i<nfiles.length;i++) {
					nfiles[i] = files[i+1];
				}
				
			//sets the static field to the new files
				files = nfiles;
			}
			
		//creates the BufferedReader with the name gotten from the array
			BufferedReader reader = 
					new BufferedReader(new FileReader(name));

		//Loop to read each line in the files
			while((line = reader.readLine())!=null) {
				
			//Separates line content and stores them as an array of strings
				String[] content = line.split("\\s+");
				
			// checks the length of the first string and initializes it 
				int length = content[0].length();
				
			
			//This statement checks if the files lines were all together with
			// no spaces example (addcourseCMSC132500) instead of 
			//(addcourse CMSC 132 500) im not sure if we were to ignore this 
			//or not so i added it just in case	
				if(content.length==1) {
		
				// if it starts with "addcourse" calls the addNewCourse 
					if(content[0].startsWith("addcourse")) {
						addNewCourse(content[0].substring(9, 13),
								Integer.parseInt(content[0].substring(13, 16)),
								Integer.parseInt
								(content[0].substring(16,length)));
					} else {
						
				//calls the addToCourse if doesnt addcourse
						addToCourse(content[0].substring(15, 19),
								Integer.parseInt(content[0].substring(19,22)),
								content[0].substring(22,24),
								content[0].substring(24,length));

					}

				// if the lines do have spaces example(addcourse CMSC 132 500)
				//then process the data normally 
				} else {
					
				//if the first element is "addcourse" calls the 
				//addNewCourse method with arguments in the right order
					if(content[0].equals("addcourse")) {
						addNewCourse(content[1],
								Integer.parseInt(content[2]),
								Integer.parseInt(content[3]));
						
				// else calls the addToCourse method with arguments in the
				// right order
					} else {
						addToCourse(content[1],
								Integer.parseInt(content[2]),
								content[3],content[4]);
					}
				}
			}
			
		// closes the BufferedReader
			reader.close();

		//if an error is to occur like a file does not exist, the thread 
		//doesnt change the registrar object and shows the error message
		} catch(Exception e) {
			System.err.print("ughhh ohhh u did smt dumb");
		}
	}

}
