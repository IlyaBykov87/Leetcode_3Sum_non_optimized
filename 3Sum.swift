func threeSum(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    let sNums = nums.sorted()

    for i in 0 ..< sNums.count {
        let num = sNums[i]
        if i > 0 && num == sNums[i - 1] {
            continue
        }

        if num > 0 {
            return res
        }

        let twoSumRes = twoSum(Array(sNums.dropFirst(i + 1)), num)
        res.append(contentsOf: twoSumRes.map { [num, $0[0], $0[1]] })
    }

    return res
}

func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var res = [[Int]]()
    var hashSet = Set<Int>()
    for num in nums {
        let diff = 0 - (target + num)
        if hashSet.contains(diff) {
            if !res.contains([num, diff]) {
                res.append([num, diff])
            }
        } else {
            hashSet.insert(num)
        }
    }
    return res
}
