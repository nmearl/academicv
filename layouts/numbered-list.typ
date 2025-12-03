#let layout-numbered-list(data, isbreakable: true) = {
  // Set width for the number column
  let number_width = 2em
  
  block(width: 100%, breakable: isbreakable)[
    // Check if data is an array (direct list of citations)
    #if type(data) == array {
      for (index, citation) in data.enumerate() {
        // Create a grid with two columns
        grid(
          columns: (number_width, 1fr),
          gutter: 1em,
          
          // Right-aligned number in the first column
          align(right)[#(index + 1).],
          
          // Citation text with markup in the second column
          [#eval(citation, mode: "markup")]
        )
        
        // Add space between entries
        if index < data.len() - 1 {
          v(0.05em)
        }
      }
    } else {
      // Assume data is an object with a 'citations' array and a 'title'
      for (i, entry) in data.enumerate() {
      // Create a title, then loop through entries
        block(width: 100%, inset: 0pt, outset: 0pt)[
          text(style: "bold", size: "1.1em")[#data.title]
        ]
        v(0.1em)
        
        for (j, citation) in entry.citations.enumerate() {
          // Create a grid with two columns
          grid(
            columns: (number_width, 1fr),
            gutter: 1em,
            
            // Right-aligned number in the first column
            align(right)[#(j + 1).],
            
            // Citation text with markup in the second column
            [#eval(citation, mode: "markup")]
          )
          
          // Add space between entries
          if j < entry.citations.len() - 1 {
            v(0.05em)
          }
        }
      }
    }
  ]
}
