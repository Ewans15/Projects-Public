package dwGraph;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/*
 * The DWGraph (Directed Weighted Graphs) Class is a generic class that creates 
 * a graph using the adjacency map method. This class has methods to create and 
 * remove its vertexes and edges, check the cost of an edge, show neighbor 
 * vertexes and creates new graphs from its original graph. Graphs created
 * with this class are all independent and any method requiring a parameter 
 * throws an IllegalArgumentException for null arguments.
 */

public class DWGraph<V extends Comparable<V>> {
	
/*since it is an Adjacency map, the field of the class is a Map type with
 * arguments of key type V and value a HashMap with key V and value as integer
 * as its weighted edge 
*/
	private Map<V, HashMap<V,Integer>> graph;
	
	
// Constructor that sets the field to a new HashMap
	public DWGraph() {
		graph = new HashMap<>();
	}

	
/*
 * The createVertex method takes in an argument of Type V and creates a 
 * new vertex in the map with no edges. If the argument is a null reference,
 * the method throws an IllegalArgumentException. This method returns true 
 * if the new vertex was successfully created and false if the vertex 
 * already exists and could not be created.
 */
	public boolean createVertex(V dataForVertex) 
			throws IllegalArgumentException {
	//throws exception if argument is null	
		if(dataForVertex==null) {
			throw new IllegalArgumentException();
		}
		boolean output = false;
	//checks if the vertex already exists if not creates it
		if(!graph.containsKey(dataForVertex)) {
		// creates a new hashmap for its edge neighbors
			HashMap<V,Integer> other = new HashMap<>();
		// sets the argument as the vertex and the new empty map as its value
			graph.put(dataForVertex, other);
			output = true;
		}
		return output;
	}


/*
 * The isVertex method checks if the provided argument is a vertex of the 
 * graph. The method throws an IllegalArgumentException if the argument 
 * is null and returns true or false depending on if the vertex is in the 
 * graph
 */
	public boolean isVertex(V dataForVertex) 
			throws IllegalArgumentException {
	// throws exception if the argument is null
		if(dataForVertex==null) {
			throw new IllegalArgumentException();
		}
	// checks if the vertex exists in the graph
		return graph.containsKey(dataForVertex);
	}

	
/*
 * The getVertices Method returns an independent list of all the vertices in
 * the graph
 */
	public Collection<V> getVertices() {
	// creates a hashset as the output
		Set<V> output = new HashSet<>();
	//iterates through the keySet of the map and adds them to the new set
		for(V x: graph.keySet()) {
			output.add(x);
		}
	//returns the new set of keys(the vertices)
		return output;
	}

	
/*
 * The createEdge method creates a directed weighted edge from the 
 * initialVertex to the finalVertex and sets its weight to the weight 
 * indicated by the parameter. The method returns either true or false 
 * depending on if the edge was created and throws an IllegalArgumentException
 * if any parameter argument is null. If either initalVertex or finalVertex
 * doesn't exist, the method creates that vertex. weight has to be >= 0 for 
 * the edge to be created 
 */
	public boolean createEdge(V initialVertex, V finalVertex, int weight) 
			throws IllegalArgumentException{
	// throws exception if the argument is null
		if(initialVertex==null||finalVertex==null) {
			throw new IllegalArgumentException();
		}
		
		boolean output = false;
	/*
	 * If weight is >= 0 , the edge can be created. if either initial or 
	 * final vertex doesn't exist, creates that vertex 
	 */
		if(weight>=0) {
			if(!graph.containsKey(initialVertex)) {
				createVertex(initialVertex);
				if(!graph.containsKey(finalVertex)) {
					createVertex(finalVertex);
				}
			}else if(!graph.containsKey(finalVertex)) {
				createVertex(finalVertex);
			}
	// adds the edge and weight to the intialVertex map of edges
			graph.get(initialVertex).put(finalVertex, weight);
			output = true;
		}
		return output;
	}

	
/*
 * The edgeCost method returns the weight of the edge connecting initialVertex 
 * to the finalVertex. If there is no edge between the two vertexes or 
 * the initialVertex does not exist in the graph, the method returns -1.
 * if an argument from the parameter is null, the method throws an 
 * IllegalArgumentException
 */
	public int edgeCost(V initialVertex, V finalVertex) 
			throws IllegalArgumentException {
		// throws exception if the argument is null
		if(initialVertex==null||finalVertex==null) {
			throw new IllegalArgumentException();
		}
		int output = -1;
	//checks if initialVertex is in the graph
		if(graph.containsKey(initialVertex)) {
			//checks if there is an edge between initial and final vertex
			if(graph.get(initialVertex).get(finalVertex)!=null) {
				//changes the output to the weight of the edge
				output = graph.get(initialVertex).get(finalVertex);
			}
		}
		return output;
	}

	
/*
 * The removeEdge method removes the edge connecting the initalVertex
 * to the finalVertex and returns true or false if the edge was removed 
 * or not. If the graph doesn't contain the initalVertex the method returns 
 * false and no changes happen to the graph. if an argument for the method 
 * is null, the graph throws an IllegalArgumentException
 */
	public boolean removeEdge(V initialVertex, V finalVertex) 
			throws IllegalArgumentException {
		// throws exception if the argument is null
		if(initialVertex==null||finalVertex==null) {
			throw new IllegalArgumentException();
		}
		boolean output = false;
		//checks if the initialVertex is in the graph
		if(graph.containsKey(initialVertex)) {
		/*
		 * checks if there is an edge between the initial and final vertex 
		 * if there is, removes the finalVertex key for the initialVertex
		 * map 
		 */
			if(graph.get(initialVertex).get(finalVertex)!=null) {
				graph.get(initialVertex).remove(finalVertex);
				output = true;
			}
		}
		return output;
	}

	
/*
 * The removeVertex method removes a vertex from the graph and returns true
 * or false if the method is removed or not. if the vertex is not in the
 * graph, returns false without changing the graph. If the argument for the 
 * parameter is null, the method throws an IllegalArgumentException
 */
	public boolean removeVertex(V dataForVertex) 
			throws IllegalArgumentException{
	// throws exception if the argument is null
		if(dataForVertex==null) {
			throw new IllegalArgumentException();
		}
		boolean output = false;
		
	//checks if the argument is in the graph
		if(graph.containsKey(dataForVertex)) {
	/*
	 * if the argument is in the graph, remove all edges to this vertex
	 * from other vertexes in the graph before removing the actual vertex
	 * from the graph.
	 */
			for(V x: graph.keySet()) {
		//iterates through all the vertexes and removes edges to the argument
				if(graph.get(x).get(dataForVertex)!=null) {
					graph.get(x).remove(dataForVertex);
				}
			}
		//remove the actual vertex from the graph 
			graph.remove(dataForVertex);
			output = true;
		}
		return output;
	}

	
/*
 * The adjacentVertices method returns an independent collection list of all
 * out going edges from this vertex. if the vertex does not exist in the 
 * graph, returns null if the vertex does exist and it has no out going 
 * edges, it returns an empty collection list. If the parameter argument is
 * null, the method throws an IllegalArgumentException
 */
	public Collection<V> adjacentVertices(V dataForVertex) 
			throws IllegalArgumentException {
	// throws exception if the argument is null
		if(dataForVertex==null) {
			throw new IllegalArgumentException();
		}
	// sets the output value to null
		Set<V> output = null;
	/*
	 * if the argument is in the graph, creates a new hashset and iterates 
	 * through the edges map of the vertex and adds its neighbors to the
	 * set
	 */
		if(graph.containsKey(dataForVertex)) {
			output = new HashSet<>();
		//iterates through the arguments neighbor map  
			for(V x: graph.get(dataForVertex).keySet()) {
				output.add(x);
			}
		}
		return output;
	}

	
/*
 * The predecessorsOfVertex method returns an independent Collection List 
 * that has all incoming vertex edges to the argument. If the graph
 * does not contain the argument parameter, returns null. if the argument 
 * does exist in the graph but no vertex point to it, it returns an empty 
 * Collection list. If the argument is null, it throws an 
 * IllegalArgumentException
 */
	public Collection<V> predecessorsOfVertex(V destVertex) 
			throws IllegalArgumentException {
		// throws exception if the argument is null
		if(destVertex == null) {
			throw new IllegalArgumentException();
		}
		// sets the output value to null
		Set<V> output = null;
		if(graph.containsKey(destVertex)) {
			output = new HashSet<>();
		/*
		 * iterates through the whole graph checking vertexes edges map
		 * looking for edges that link to the argument and adds it to the 
		 * set
		 */
			for(V x: graph.keySet()) {
				// checks all the vertexes outgoing edges to see if one of
				//them links to the argument 
				for(V y: graph.get(x).keySet()) {
					// checks if they are the same vertex
					if(y.equals(destVertex)) {
						output.add(y);
					}
				}
			}
		}
		return output;
	}

	
/*
 * The divideGraph Method takes in the argument list and separates values 
 * from said list from the current object graph to make a new independent
 * DWGraph. vertices in the collection argument are removed from the 
 * current graph and added to a new graph. The method returns the new 
 * graph made of the collections parameter. If the argument is null, the 
 * method throws an IllegalArgumentException
 * 
 */
	public DWGraph<V> divideGraph(Collection<V> verticesForNewGraph) 
			throws IllegalArgumentException{
	// throws exception if the argument is null
		if(verticesForNewGraph==null) {
			throw new IllegalArgumentException();
		}
	// first creates the new DWGraph and add all the values of the argument
		//as vertexes if they exist in the current DWGraph
		DWGraph<V> output = new DWGraph<V>();
		for(V x: verticesForNewGraph) {
			if(graph.containsKey(x)) {
				output.createVertex(x);
			}
		}
	
	/*
	 * once all the values are added as vertexes of the new DWGraph checks if
	 * the new DWGraph is still empty if its not, iterates through the 
	 * new DWGraph checking the current DWGraph for its edges and adds it 
	 * to the new DWGgraph
	 */
		if(output.graph.size()>0) {
		// first for each loop iterates the new DWGraph
			for(V x: output.graph.keySet()) {
			/*second for each loop iterates the original DWGraph using the 
			 * new graphs vertexes for its edge lists 
			 */
				for(V y: graph.get(x).keySet()) {
				/*
				 * once we get the edge list, we only want edges that are in
				 * the new DWGraph so we check if the vertex connected by 
				 * the edge is in the new DWGraph we add the edge to the 
				 * new DWGraph, if not we ignore that edge.
				 */
					if(output.graph.containsKey(y)) {
						output.createEdge(x,y,graph.get(x).get(y));
					}
				}
			}
		/* once we are done adding all the vertexes and edges to the new
		 * DWGgraph, we remove the vertexes from the original graph
		 */
			
			for(V x: verticesForNewGraph) {
				removeVertex(x);
			}
		}
		return output; 
	}

}
