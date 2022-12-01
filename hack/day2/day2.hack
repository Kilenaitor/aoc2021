use namespace HH\Lib\{C, File, Str, Vec};

<<__EntryPoint>>
async function day2(): Awaitable<void> {
  $commands = await File\open_read_only('input.txt')->readAllAsync()
    |> Str\split($$, "\n");

  // Part 1
  $position = 0;
  $depth = 0;

  foreach ($commands as $command) {
    if (Str\length($command) === 0) {
        continue;
    }
    list($command, $amount) = Str\split($command, " ");
    switch ($command) {
        case SubmarineCommand::FORWARD:
          $position += (int)$amount;
          break;
        case SubmarineCommand::DOWN:
          $depth += (int)$amount;
          break;
        case SubmarineCommand::UP:
          $depth -= (int)$amount;
          break;
    }
  }
  echo "Position: $position\n";
  echo "Depth: $depth\n";
  echo 'Result: '.($position * $depth)."\n";

  // Part 2
  $position = 0;
  $depth = 0;
  $aim = 0;

  foreach ($commands as $command) {
    if (Str\length($command) === 0) {
        continue;
    }
    list($command, $amount) = Str\split($command, " ");
    switch ($command) {
        case SubmarineCommand::FORWARD:
          $position += (int)$amount;
          $depth += (int)$amount * $aim;
          break;
        case SubmarineCommand::DOWN:
          $aim += (int)$amount;
          break;
        case SubmarineCommand::UP:
          $aim -= (int)$amount;
          break;
    }
  }
  echo "Position: $position\n";
  echo "Depth: $depth\n";
  echo 'Result: '.($position * $depth)."\n";
}

enum SubmarineCommand: string as string {
  FORWARD = 'forward';
  DOWN = 'down';
  UP = 'up';
}
