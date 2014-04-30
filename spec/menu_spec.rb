require_relative 'test_buddy'

describe "Menu Integration" do
  let(:menu_text) do
<<EOS
         MAIN MENU
===========================
1. Find a drink by name
2. Enter ingredients to find a drink
3. Random cocktail
4. Random shot
5. Exit
==========================
 Enter a menu number:
EOS
  end
  context "The menu displays on startup" do
    let(:shell_output){ run_rotr_w_input() }
    it "should print the menu" do
      shell_output.should include ("Input drink name: ")
    end
  end

end
