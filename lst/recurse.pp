define recurse($array) {
  if !empty($array) {
    $car = $array[0]            # first item
    $cdr = delete_at($array, 0) # rest of array

    # Recursive declaration for remaining resources
    recurse { "recurse-${car}": array => $cdr }

    # Do something useful here using $car
  }
}
