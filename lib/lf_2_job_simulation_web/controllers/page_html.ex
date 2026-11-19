defmodule Lf2JobSimulationWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """

  use Lf2JobSimulationWeb, :html

  embed_templates "page_html/*"

  attr :options, :list, default: []
  attr :name, :string, required: true
  attr :test1, :boolean, required: true
  attr :result_quiz, :map, required: true

  def word_dropdown(assigns) do
    ~H"""
    <%= if @test1 do %>
      <span class="text-green-600">{Map.get(@result_quiz, "#{@name}")
      |> Map.get(:right_answer)}.</span>
      <%= if Map.get(@result_quiz, "#{@name}") |> Map.get(:is_right) == false do %>
        <span class="text-red-500">
          (IHRE ANTWORT: {Map.get(@result_quiz, "#{@name}") |> Map.get(:answer)})
        </span>
      <% end %>
    <% else %>
      <select
        name={@name}
        data-autosave
        class="appearance-none inline-block align-baseline w-auto min-w-0
      border-0 border-b border-base/40 rounded-none bg-transparent m-0 px-0
      py-0 leading-none shadow-none outline-none focus:outline-none
      focus:ring-0 focus:border-primary"
      >
        <option value="" disabled selected></option>

        <%= for option <- (@options) do %>
          <option value={option}>{option}</option>
        <% end %>
      </select>
    <% end %>
    """
  end

  attr :question, :string, required: true
  attr :options_single_questions, :list, required: true
  attr :name, :string, required: true
  attr :test1, :boolean, required: true
  attr :result_quiz, :map, required: true

  def single_choice(assigns) do
    ~H"""
    <div class="mb-6">
      <p class="font-semibold mb-2">{@question}</p>

      <div class="flex flex-col gap-2">
        <%= if @test1 do %>
          <span class="text-green-600">{Map.get(@result_quiz, "#{@name}")
          |> Map.get(:right_answer)}.</span>
          <%= if Map.get(@result_quiz, "#{@name}") |> Map.get(:is_right) == false do %>
            <span class="text-red-500">
              (IHRE ANTWORT: {Map.get(@result_quiz, "#{@name}") |> Map.get(:answer)})
            </span>
          <% end %>
        <% else %>
          <%= for {option_single_questions, index} <- Enum.with_index(@options_single_questions) do %>
            <label class="flex items-center gap-2 cursor-pointer">
              <input
                type="radio"
                name={@name}
                value={option_single_questions}
                data-autosave
                class="radio radio-base-content radio-sm"
              />
              <span>{option_single_questions}</span>
            </label>
          <% end %>
        <% end %>
      </div>
    </div>
    """
  end
end
