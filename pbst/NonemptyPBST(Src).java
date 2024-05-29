package pbst;

import java.util.Collection;
import java.util.ArrayList;

/*
 * This class is a Subclass of PBST(Polymorphic Binary Search Tree). 
 * NonemptyPBST represents a node in the tree that is considered to not
 * be empty. This class has two methods that modify the tree
 * addKeyValuePair and removeKeyValuePair. The rest of the methods in this 
 * class give information pertaining the tree.
 */
@SuppressWarnings("unchecked")
public class NonemptyPBST<K extends Comparable<K>, V> extends PBST<K, V> {
	
	private PBST<K,V> right; //field for right node
	private PBST<K,V> left; // field for left node
	private V nonemptyValue; // value
	private K nonemptyKey; // key
	
/*
 * Constructor. The constructor takes in a key and value as its parameters
 * and sets it left and right offsprings to the single emptyPBST
 */
	public NonemptyPBST(K key, V value){
		nonemptyValue = value;
		nonemptyKey = key;
		this.right=this.left= EmptyPBST.getInstance();
	}

	
/*
 * The addKeyValuePair adds elements into the tree while maintaining its 
 * binary search properties. if either parameter values are null, the
 * method throws an IllegalArgumentException. The method returns the modified 
 * version of the tree
 */
	public NonemptyPBST<K, V> addKeyValuePair(K key, V value) 
			throws IllegalArgumentException{
		if(key == null||value == null) {
	//throws exception if either parameters are null
			throw new IllegalArgumentException();
		}
	
		
	/*
	 * if the key to input is less than the current key, go left if greater,
	 * goes right but if they are the same, changes the value of the current 
	 * node to the value to be inputed
	 */
		if(key.compareTo(nonemptyKey)<0) {
			left = left.addKeyValuePair(key,value);
		}else if (key.compareTo(nonemptyKey)>0) {
			right = right.addKeyValuePair(key,value);
		}else {
			nonemptyValue = value;
		}
		return this;
	}

	
	/*
	 * The numPairs method counts up how many key/value pairs are in the 
	 * current tree. Each Nonempty node counts as 1
	 */
	public int numPairs() {
		int output;
		output=1+left.numPairs(); // add up the left side 
		output+=right.numPairs(); //adds up the right side
		return output;
	}


	/*
	 * The getValueByKey method searches for the key parameter in the tree
	 * and returns the value associated with that key. If the key is not 
	 * found, returns null. This method throws an IllegalArgumentException if
	 * the parameter input is null.
	 */
	public V getValueByKey(K keyToLookUp) 
				throws IllegalArgumentException{
		V output;
		
		if(keyToLookUp==null) {
			throw new IllegalArgumentException(); 
		}
	/*
	 * searches for the tree using the binary tree search method and calls it
	 * recursively on its left or right child. if the key is found, sets 
	 * output to its value and returns output	
	 */
		if(keyToLookUp.compareTo(nonemptyKey)<0) {
			output = left.getValueByKey(keyToLookUp);
		}else if(keyToLookUp.compareTo(nonemptyKey)>0) {
			output = right.getValueByKey(keyToLookUp);
		}else {
			output = nonemptyValue; 
		}
		return output;
	}

	
	/*
	 * This method searches the tree looking for the largestKey and returns
	 * that value. The method throws an EmptyPBSTException when reaching 
	 * an empty PBST
	 */
	public K largestKey() throws EmptyPBSTException {
		K output;
	
	/*
	 * recursively call the right node since the larger keys always go
	 * right when the exception is thrown that means its at the end of the
	 * tree and returns to the previous node that called it. returns that
	 * nodes key since it would be the biggest one
	 */
		try {
			output = right.largestKey(); 
		}catch(Exception e) {
			output = nonemptyKey;
		}
		return output;
		
	}

	
	/*
	 * This method searches the tree looking for the smallestKey and returns
	 * that value. The method throws an EmptyPBSTException when reaching 
	 * an empty PBST
	 */
	public K smallestKey() throws EmptyPBSTException {
		K output;
		
		/*
		 * recursively call the left node since the smallest keys always go
		 * left when the exception is thrown that means its at the end of the
		 * tree and returns to the previous node that called it. returns that
		 * nodes key since it would be the biggest one
		 */
		try {
			output = left.smallestKey();
		}catch(Exception e) {
			output = nonemptyKey;
		}
		return output;
	}
	
	
	/*
	 * The pathBalance returns an int showing the path needed to get to the
	 * desired key in the parameter. Each time the method transveres left, 
	 * we subtract 1 while if it goes right, we add 1. if the key is not 
	 * in the tree, we throw an IllegalArgumentException. if the parameter is
	 * null, throws an IllegalArgumentException
	 */
	public int pathBalance(K keyToFind) 
			throws IllegalArgumentException{
		if(keyToFind==null) {
			throw new IllegalArgumentException();
		}
		int output = 0;
	/*
	 * Searches for the key using the binary tree component, each time we 
	 * go left we decrease the output by 1 and increase it by 1 if we go
	 * right.
	 */
		if (keyToFind.compareTo(nonemptyKey)<0) {
			output=left.pathBalance(keyToFind)-1;
		}else if(keyToFind.compareTo(nonemptyKey)>0) {
			output=1+right.pathBalance(keyToFind);
		}else {
			output+=0;
		}
		return output;
	}
	
	
	/*
	 * this method creates a collection and add all  key elements of the tree 
	 * into that collection and returns it
	 */
	public Collection<K> collectionOfKeys() {
		Collection<K> output = new ArrayList<K>(); // creates collections
		output = collectionHelper(output,this); //calls helper method
		return output;
	}
	
	/*
	 * the coletionHelper method is a method that passes down the same
	 * collection created by its parent method and adds the elements of the 
	 * tree into it
	 */
	public Collection<K> collectionHelper
					(Collection<K> output, NonemptyPBST<K,V> node){
		left.collectionHelper(output,this).add(nonemptyKey); // adds left keys
		right.collectionHelper(output,this).add(nonemptyKey); // adds right key
		return output;
	}
	
	
	/*
	 * this method removes the key value of the parameter from the tree.
	 * if the key is not found in the tree then it just returns the 
	 * unchanged tree but if it is, it is replaced with either 
	 * its smallest child from the right or its largest child from the left.
	 * if the parameter is null, throws an IllegalArgumentException
	 */
	public PBST<K, V> removeKeyValuePair(K keyToRemove) 
			throws IllegalArgumentException{
		if(keyToRemove==null) {
			throw new IllegalArgumentException();
		}
		
		/*
		 * Searches for the key using the binary tree search properties 
		 */
		if(keyToRemove.compareTo(nonemptyKey)<0) {
			left = left.removeKeyValuePair(keyToRemove);
		}else if (keyToRemove.compareTo(nonemptyKey)>0) {
			 right = right.removeKeyValuePair(keyToRemove);
		}
		else {
		/*
		 * When it does find its value we check if its a leaf. if it is a leaf,
		 * it would throw the EmptyPBSTException and we catch it by returning 
		 * an emptyPBST for its parent to right or left to equals.
		 * If its not a leaf, it copies the smallestKey and value to itself
		 * and removes that smallest key from the tree. if it does not have 
		 * any right children, it would copy its largestKey from the left 
		 * and its value and delete that value from the tree
		 */
			try {
				nonemptyKey = right.smallestKey();
				nonemptyValue = right.getValueByKey(nonemptyKey);
				right = right.removeKeyValuePair(nonemptyKey);
			}catch (Exception e){
				try {
					nonemptyKey = left.largestKey();
					nonemptyValue = left.getValueByKey(nonemptyKey);
					left = left.removeKeyValuePair(nonemptyKey);
				}catch(Exception e2) {
					return left.removeKeyValuePair(keyToRemove);
				}
			}
		}
		
		return this;	
	}
	
	
	
	/*
	 * toString method that returns the key/value pairs of the tree 
	 * in inorder sequence
	 */
	public String toString() {
		return toString(nonemptyKey,nonemptyValue);
	}
	
	/*
	 * toString helper that passes the key, value of the current node 
	 * to be called recursively and registered 
	 */
	private String toString(K key, V value) {
		String output;
		String rightstr, leftstr;
	//gets the left side first since its inorder transversal 
		leftstr = left.toString(); 
	//then gets the right side 
		rightstr = right.toString();
		output =  leftstr+key.toString()+"/"+value.toString()+" "+rightstr;

		return output;
	}

}
