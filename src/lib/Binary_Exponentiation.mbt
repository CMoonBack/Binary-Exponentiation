///| Calculates the power of a number using binary exponentiation algorithm, also
/// known as fast exponentiation.
///
/// Parameters:
///
/// * `base` : The base number to be raised to a power.
/// * `exponent` : The power to which the base number is to be raised.
///
/// Returns the result of raising `base` to the power of `exponent`.
///
/// Example:
///
/// ```moonbit
/// test "bin_pow/basic" {
///   inspect!(bin_pow(2, 3), content="8")
///   inspect!(bin_pow(2, 0), content="1")
/// }
/// 
/// test "bin_pow/large_numbers" {
///   inspect!(bin_pow(15, 20), content="4664335276710460609")
/// }
/// ```
pub fn bin_pow(x : Int64, y : Int64) -> Int64 {
  let mut res : Int64 = 1
  let mut a : Int64 = x
  let mut n : Int64 = y
  while n > 0 {
    if n % 2 == 1 {
      res = res * a
    }
    a = a * a
    n = n >> 1
  }
  res
}

///| Calculates the modular exponentiation using binary exponentiation algorithm
/// (also known as fast exponentiation). This is particularly useful for
/// computing large powers in modular arithmetic without causing overflow.
///
/// Parameters:
///
/// * `base` : The base number to be raised to a power.
/// * `exponent` : The power to which the base number is to be raised.
/// * `modulus` : The positive integer by which to take the modulo of the result.
///
/// Returns the result of (base^exponent) mod modulus.
///
/// Aborts if the modulus is not positive.
///
/// Example:
///
/// ```moonbit
/// test "bin_pow_mod/basic" {
///   inspect!(bin_pow_mod(2, 3, 5), content="3")
///   inspect!(bin_pow_mod(2, 0, 3), content="1")
/// }
/// 
/// test "bin_pow_mod/large_numbers" {
///   inspect!(bin_pow_mod(15, 20, 1000000007), content="393128630")
/// }
/// 
/// test "panic bin_pow_mod/invalid_modulus" {
///   let _ = bin_pow_mod(2, 3, 0)
/// }
/// ```
pub fn bin_pow_mod(x : Int64, y : Int64, z : Int64) -> Int64 {
  let mut res : Int64 = 1
  let mut a : Int64 = x
  let mut n : Int64 = y
  let m : Int64 = z
  if m <= 0 {
    abort(
      "ModulosNumberError: The number of modulos should be a positive integer",
    )
  }
  a = a % m
  while n > 0 {
    if n % 2 == 1 {
      res = res * a % m
    }
    a = a * a % m
    n = n >> 1
  }
  res
}
