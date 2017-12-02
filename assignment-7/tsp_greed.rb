require_relative 'node'

class NearestNeighbor
    attr_accessor :data
    
    def initialize
        @data = []
    end
    
    def insert(node)
        @data.push(node)
    end
    
    
    def find_shortest_path(start_node, node_array) #node_array does not include start_node
        
        path = []
        path.push(start_node)
        
        return path if node_array == []
        
        nearest_neighbor =  find_nearest_neighbor(start_node, node_array)
        node_array.delete(nearest_neighbor)
        path.push(find_shortest_path(nearest_neighbor, node_array))
        path.flatten!
        
        return path
    end
    
    def find_nearest_neighbor(node, node_array)
        closest_node = node_array[0]
        node_array.each do |neighbor|
            if ((node.x - neighbor.x).abs + (node.y - neighbor.y).abs) < ((node.x - closest_node.x).abs + (node.y - closest_node.y).abs)
                closest_node = neighbor
            end
        end
        return closest_node
    end

    
end