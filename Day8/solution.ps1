#$data = Get-Content C:\Users\Thomas\Documents\code\REPOS\adventofcode2021\Day8\data.txt

$data = 'be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce'

#length coding
$one = 2
$four = 4
$seven = 3
$eight = 7

$sum = 0

$readings = $data.Split([Environment]::NewLine)


foreach ($reading in $readings) {
  # Skip Blank Lines
  if ($reading -eq '') {
      continue
  }

  $signals = $reading.Split('|')[0]
  try{$signals = $signals.Trim()}catch{}
  $signals = $signals.Split(' ')

  $output = $reading.Split('|')[1]
  try{$output = $output.Trim()}catch{}
  $output = $output.Split(' ')


  # Define the variables need . . .
  $zeroKey = ''
  $oneKey = ''
  $twoKey = ''
  $threeKey = ''
  $fourKey = ''
  $fiveKey = ''
  $sixKey = ''
  $sevenKey = ''
  $eightKey = ''
  $nineKey = ''

  # Determine the signal strings
  foreach ($signal in $signals) {
    $length = $signal.Length

    # 0

    # 1
    if ($length -eq $one) {
      $oneKey = $signal
    }

    # 2
    if ($length -eq 5) {
      $twoKey = $signal
    }

    # 3

    # 4
    if ($length -eq $four) {
      $fourKey = $signal
    }

    # 5

    # 6

    # 7
    if ($length -eq $seven) {
      $sevenKey = $signal
    }

    # 8
    if ($length -eq $eight) {
      $eightKey = $signal
    }

    # 9
  }

  # Match signal keys with the output
  $readingOutput = ''
  $sum = 0
  foreach ($code in $output) {
    $length = $code.Length
    $base = $code.ToCharArray()


    # Logic:
    <#
    char[] str1 = s1.toCharArray();
    char[] str2 = s2.toCharArray();
    Sort each char[]

    Arrays.sort(str1);
    Arrays.sort(str2);
    Check if equal

    return Arrays.equals(str1, str2);
    #>

    # 0

    # 1
    if ($length -eq $one) {
      $readingOutput += '1'
    }

    # 2
    if ($length -eq 5) {
      Write-Host $twoKey
      $compare = $twoKey.ToCharArray()
      $results = Compare-Object -ReferenceObject $base -DifferenceObject $compare

      # If null than it is a match and add to readingOutput
      if ($null -eq $results) {
        $readingOutput += '2'
      }
      
    }

    # 3

    # 4
    if ($length -eq $four) {
      $readingOutput += '4'
    }

    # 5

    # 6

    # 7
    if ($length -eq $seven) {
      $readingOutput += '7'
    }

    # 8
    if ($length -eq $eight) {
      $readingOutput += '8'
    }

    # 9
  }
  

  Write-Host "String [$signals | $output] output converted to : [$readingOutput]"
}



<#

foreach ($reading in $readings) {
    if ($reading -eq '') {
        continue
    }
    $signalWires = $reading.Split('|')[0]
    $output = $reading.Split('|')[1]
    try{$output = $output.Trim()}catch{}

    $oneRead = $output.Split(' ')
    $readingOutput = ''
    $tmpstr = ''
    $sum = 0

    foreach ($item in $oneRead) {
      $length = $item.Length
        
      # Part One: Handle the knowns already 1,4,7,8 . . .
      if ($length -eq $one) {
        $tmpstr = '1'
      }
      if ($length -eq $four) {
        $tmpstr = '4'
      }
      if ($length -eq $seven) {
        $tmpstr = '7'
      }
      elseif ($length -eq $eight) {
        $tmpstr = '8'
      }


      # Part two: Handle the others 2,3,5,6,9,0
      if ($length -eq 5) {
        $tmpstr = '3'
        if ($item -contains 'g') {
          $tmpstr = '2'
        }
        if ($item -contains 'e') {
          $tmpstr = '5'
        }
      }
      
      if ($length -eq 6){
        if (($item -notcontains 'd') -or ($item -notcontains 'b') -or ($item -notcontains 'a')) {
          $tmpstr = '6'
          Write-Host "Six"
        }
        if ($item -notcontains 'g') {
          $tmpstr = '9'
        }
        if ($item -notcontains 'f' -and $item -contains 'g') {
          $tmpstr = '0'
        }
      }


        $readingOutput += $tmpstr
        $tmpstr = ''
    }



    Write-Host "String [$output] output converted to : [$readingOutput]"
}

#>

return