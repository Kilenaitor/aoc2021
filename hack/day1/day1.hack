use namespace HH\Lib\{C, File, Str, Vec};

<<__EntryPoint>>
async function main(): Awaitable<void> {
  $depths = await File\open_read_only('input.txt')->readAllAsync()
    |> Str\split($$, "\n")
    |> Vec\map($$, $depth ==> (int)$depth);

  // Part 1
  $num_increases = 0;
  for ($i = 0; $i < C\count($depths) - 1; $i++) {
    if ($depths[$i + 1] > $depths[$i]) {
      $num_increases++;
    }
  }
  echo Str\format("Increased %d times\n", $num_increases);

  // Part 2
  $depth_windows = vec[];
  for ($i = 0; $i < C\count($depths) - 2; $i++) {
    $depth_windows[] = $depths[$i] + $depths[$i + 1] + $depths[$i + 2];
  }

  $num_window_increases = 0;
  for ($i = 0; $i < C\count($depth_windows) - 1; $i++) {
    if ($depth_windows[$i + 1] > $depth_windows[$i]) {
      $num_window_increases++;
    }
  }
  echo Str\format("Increased %d times\n", $num_window_increases);
}
