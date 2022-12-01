use namespace HH\Lib\{C, File, Str, Vec};

<<__EntryPoint>>
async function day3(): Awaitable<void> {
  $binary_numbers = await File\open_read_only('input.txt')->readAllAsync()
    |> Str\split($$, "\n")
    |> Vec\filter($$, $line ==> !Str\is_empty($line));

  // Part 1
  $counts = Vec\fill(Str\length($binary_numbers[0]), 0);
  foreach ($binary_numbers as $binary_number) {
    foreach (Str\chunk($binary_number) as $index => $digit) {
      $counts[$index] += (int)$digit;
    }
  }

  $gamma = '';
  $epsilon = '';
  foreach ($counts as $digit_count) {
    $is_1 = $digit_count >= C\count($binary_numbers) / 2;
    $gamma .= $is_1 ? '1' : '0';
    $epsilon .= $is_1 ? '0' : '1';
  }

  echo "Gamma: $gamma\n";
  echo "Epsilon: $epsilon\n";
  echo 'Result: '.\bindec($gamma) * \bindec($epsilon)."\n";

  // Part 2
  $o2_numbers = $binary_numbers;
  for ($i = 0; $i < Str\length($binary_numbers[0]); $i++) {
    if (C\count($o2_numbers) === 1) {
      break;
    }

    $ones = 0;
    foreach ($o2_numbers as $o2_number) {
      $ones += (int)$o2_number[$i];
    }

    $most_common_value = $ones >= C\count($o2_numbers) / 2 ? '1' : '0';
    $o2_numbers =
      Vec\filter($o2_numbers, $number ==> $number[$i] === $most_common_value);
  }
  $o2_number = C\onlyx($o2_numbers);
  echo "O2 Number: $o2_number\n";

  $co2_numbers = $binary_numbers;
  for ($i = 0; $i < Str\length($binary_numbers[0]); $i++) {
    if (C\count($co2_numbers) === 1) {
      break;
    }

    $ones = 0;
    foreach ($co2_numbers as $co2_number) {
      $ones += (int)$co2_number[$i];
    }

    $least_common_value = $ones >= C\count($co2_numbers) / 2 ? '0' : '1';
    $co2_numbers =
      Vec\filter($co2_numbers, $number ==> $number[$i] === $least_common_value);
  }
  $co2_number = C\onlyx($co2_numbers);
  echo "CO2 Number: $co2_number\n";
  echo 'Result: '.\bindec($o2_number) * \bindec($co2_number)."\n";
}
