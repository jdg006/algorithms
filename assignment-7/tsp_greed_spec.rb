include RSpec

require_relative 'tsp_greed'
require_relative 'node'

RSpec.describe NearestNeighbor, type: Class do
    
    let (:graph) {NearestNeighbor.new}
    let (:a) {Node.new(1,1,"a")}
    let (:b) {Node.new(3,1,"b")}
    let (:c) {Node.new(8,2,"c")}
    let (:d) {Node.new(3,7,"d")}
    let (:e) {Node.new(1,4,"e")}
    let (:f) {Node.new(9,1,"f")}
    let (:g) {Node.new(1,9,"g")}
    let (:h) {Node.new(6,6,"h")}
    
    describe "insert" do 
        it "properly inserts a node in the graphs node array" do
            graph.insert(a)
            expect(graph.data).to eq [a]
            graph.insert(b)
            expect(graph.data).to eq [a, b]
        end
        
    end
    
    
    describe "find_nearest_neighbor" do 
        
        it "finds the nearest neighbor of a node from a list of potential neighbors" do
            graph.insert(a)
            graph.insert(b)
            graph.insert(c)
            graph.insert(d)
            graph.insert(e)
            expect(graph.find_nearest_neighbor(a,[b,c,d,e])).to eq b
            expect(graph.find_nearest_neighbor(c,[a,b,d,e])).to eq b
            expect(graph.find_nearest_neighbor(d,[a,b,c,e])).to eq e
        end
        
    end
    
    describe "find_shortest_path" do 
        
        it "takes a starting node and an array of other nodes and returns the shortest possible path between them" do
            graph.insert(a)
            graph.insert(b)
            graph.insert(c)
            graph.insert(d)
            graph.insert(e)
            graph.insert(f)
            graph.insert(g)
            graph.insert(h)
            expect(graph.find_shortest_path(a,[b,c])).to eq [a,b,c]
            expect(graph.find_shortest_path(a,[b,c,d,e,f,g,h])).to eq [a,b,e,d,g,h,c,f]
            expect(graph.find_shortest_path(d,[a,b,c,e,f,g,h])).to eq [d,g,e,a,b,c,f,h]
            
        end
        
    end
  
end
 