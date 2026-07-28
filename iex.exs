IEx.configure(
  colors: [enabled: true],
  inspect: [pretty: true, width: 100, limit: :infinity],
  history_size: 20000
)

defmodule R do
  def r, do: IEx.Helpers.recompile()
end

IO.puts(IO.ANSI.faint() <> "iex ready — type R.r to recompile" <> IO.ANSI.reset())
