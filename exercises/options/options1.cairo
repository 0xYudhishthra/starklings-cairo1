// options1.cairo
// Execute `starklings hint options1` or use the `hint` watch subcommand for a hint.


use option::OptionTrait;

// This function returns how much icecream there is left in the fridge.
// If it's before 10PM, there's 5 pieces left. At 10PM, someone eats them
// all, so there'll be no more left :(
fn maybe_icecream(
    time_of_day: usize
) -> Option<usize> { // We use the 24-hour system here, so 10PM is a value of 22 and 12AM is a value of 0
// The Option output should gracefully handle cases where time_of_day > 23.
// TODO: Complete the function body - remember to return an Option!
     if time_of_day >= 22 && time_of_day <= 23 {
        return Option::Some(0);
    } else if time_of_day < 22 {
        return Option::Some(5);
    } else {
        return Option::None;
    }
}


#[test]
fn check_icecream() {
    assert(maybe_icecream(9).unwrap() == 5, 'err_1');
    println!("Test 1 passed");
    assert(maybe_icecream(10).unwrap() == 5, 'err_2');
    println!("Test 2 passed");
    assert(maybe_icecream(23).unwrap() == 0, 'err_3');
    println!("Test 3 passed");
    assert(maybe_icecream(22).unwrap() == 0, 'err_4');
    println!("Test 4 passed");
    assert(maybe_icecream(25).is_none(), 'err_5');
    println!("Test 5 passed");
}

#[test]
fn raw_value() {
    // TODO: Fix this test. How do you get at the value contained in the Option?
    let icecreams = maybe_icecream(12);
    match icecreams {
        Option::Some(value) => assert(value == 5, 'err_6'),
        Option::None => panic!("No icecreams returned"),
    }}
