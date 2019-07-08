import Foundation

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}
public class LongestPalindromeSubstring{
    
    public static func function(myString args: [String]?) -> String {
        
        if args == nil || args!.count == 0 || args![0].count == 0 {
            return ""
        }else if args!.count == 1 {
            return args![0]
        }
        
        /*This is the base string that will compare with others*/
        var charArray = args![0]
        
        /*Array of integers to set how much a letter was repeated*/
        var intArray = [Int](repeating: 0, count: charArray.count)
        for i in 1..<args!.count {
            
            var count = 0
            
            while charArray.count - 1 >= count && args![i].count - 1 >= count {
                
                if charArray[count] == args![i][count] {
                    
                    intArray[count] += 1
                    
                }else{
                    
                    break;
                    
                }
                
                count += 1
                
            }
            
        }
        
        var result:String = ""
        
        
        for index in 0..<intArray.count {
            
            if intArray[index] == args!.count-1 {
                result += String(charArray[index])
            }
            
        }
        
        return result
        
    }
    
}

