pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- game of life
-- by geopet (geoff petrie)

alive_color = 7
width = 128
height = 128

board_i = 1

boards = { {}, {} }

for y = 1, height do
  boards[1][y] = {}
  boards[2][y] = {}

  for x = 1, width do
    boards[1][y][x] = 0
    boards[2][y][x] = 0
  end
end

boards[1][60][64] = 1
boards[1][60][65] = 1
boards[1][61][63] = 1
boards[1][61][64] = 1
boards[1][62][64] = 1

cls()

function check_cell_location (bi, x, y)
  if ((x < 1) or (x > width) or (y < 1) or (y > height)) then
    return 0
  end

  return boards[bi][y][x]
end

while true do
  for y = 1, height do
    for x = 1, width do
      pset(x - 1, y - 1, boards[board_i][y][x] * alive_color)
    end
  end

  other_i = (board_i % 2) + 1

  for y = 1, height do
    for x = 1, width do
      neighbors = (
        check_cell_location (board_i, x + 1, y + 1) +
        check_cell_location (board_i, x - 1, y - 1) +
        check_cell_location (board_i, x + 1, y - 1) +
        check_cell_location (board_i, x - 1, y + 1) +
        check_cell_location (board_i, x, y - 1) +
        check_cell_location (board_i, x, y + 1) +
        check_cell_location (board_i, x - 1, y) +
        check_cell_location (board_i, x + 1, y)
      )
      if ((neighbors == 3) or
         ((boards[board_i][y][x]) == 1 and (neighbors == 2))) then
           boards[other_i][y][x] = 1
      else
        boards[other_i][y][x] = 0
      end
    end
  end

  board_i = other_i

  flip()
end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
