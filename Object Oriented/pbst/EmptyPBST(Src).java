package pbst;

import java.util.ArrayList;
import java.util.Collection;

/*
 * This class is a polymorphic subclass of PBST(Polymorphic Binary Search Tree).
 * The class is a singleton type meaning it has a single empty list that 
 * represents the end of the tree. Methods in this class are meant to
 * determine what the tree should do when it gets to the end of a path.
 */

@SuppressWarnings({"unchecked", "rawtypes"})
public class EmptyPBST<K extends Comparable<K>, V> extends PBST<K, V> {
	
	//creates the singleton empty list and sets it to a variable
	private static EmptyPBST empty = new EmptyPBST();
	
	// private constructor so no more empty lists can be created 
	private EmptyPBST(){
	}
	
	// this method returns the only empty list created by the class
	public static EmptyPBST getInstance() {
		return empty;
	}

	/*
	 * This method for the empty list class creates a new nonempty list 
	 * using the parameters given
	 */
	public NonemptyPBST<K, V> addKeyValuePair(K newKey, V newValue) {
		return new NonemptyPBST(newKey,newValue);
	}

	//this method for the empty list class return 0 since it has no 
	//key/value pairs
	public int numPairs() {
		return 0;
	}

	//this method for the empty list class returns null since if we get to
	//the end of the tree then the key was never found
	public V getValueByKey(K keyToLookUp) {
		V output = null;
		return output;
	}

	//this method for the emptyList class throws the EmptyPBSTException since
	//if we get here, we are at the end of the tree
	public K largestKey() throws EmptyPBSTException {
		throw new EmptyPBSTException();
	}

	//this method for the emptyList class throws the EmptyPBSTException since
		//if we get here, we are at the end of the tree
	public K smallestKey() throws EmptyPBSTException {
		throw new EmptyPBSTException();
	}

	//this method throws the IllegalArgumentException if the keytoFind 
	//was never found
	public int pathBalance(K keyToFind) 
			throws IllegalArgumentException{
		throw new IllegalArgumentException();
	}

	//this method returns a collection
	public Collection<K> collectionOfKeys() {
		ArrayList<K> output = new ArrayList<K>();
		return output;
	}
	
	//the emptylist collection helper just returns the collections list 
	//that called the method
	public Collection<K> collectionHelper(Collection<K> output,
			NonemptyPBST<K, V> nonemptyPBST){
		return output;
	}

	// this method for the empty list class returns an empty list 
	public PBST<K, V> removeKeyValuePair(K keyToRemove) {
		return this;
	}

	// returns an empty string since the list is empty
	public String toString() {
		return "";
	}

}
