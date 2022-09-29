# mergeSort.py
# Andy Jang
# 9/20/2022
# CSCI 355


# mergesort sorts a given array by splitting the array and sorthing the splits recursively
def mergeSort(arr):
    if len(arr) > 1:
        half = len(arr) // 2

        # split into left and right
        left = arr[:half]
        right = arr[half:]

        mergeSort(left)
        mergeSort(right)

        i = j = k = 0

        # comparison
        while i < len(left) and j < len(right):
            if left[i] < right[j]:
                arr[k] = left[i]
                i += 1
            else:
                arr[k] = right[j]
                j += 1
            k += 1

        # account for leftovers
        while i < len(left):
            arr[k] = left[i]
            i += 1
            k += 1

        while j < len(right):
            arr[k] = right[j]
            j += 1
            k += 1

    return arr

# user input filtering


def getUserInput():
    keepGoing = True
    arr = []
    count = 0

    # stops at count = 10
    print("The system will prompt for numbers to be sorted, please enter them one at a time")
    print("To stop inputting, enter any non-numerical value.")
    print("Max 10 numbers will be taken.")
    while (keepGoing):
        userNum = input("Num: ")
        try:
            userNum = int(userNum)
            arr.append(userNum)
            count += 1
        except:
            keepGoing = False

        if (count == 10):
            keepGoing = False

    return arr


def main():
    print("Sorted Array:", mergeSort(getUserInput()))


# header guard
if __name__ == "__main__":
    main()
