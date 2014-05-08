require "spec_helper"
require "menu"



describe "Menu Integration" do
  let(:menu_text) do
<<EOS
             MAIN MENU
===================================
1. Find a drink by name
2. Find drink by ingredients
3. Random cocktail
4. Random shot
5. Exit
===================================
Enter a menu number:
EOS
  end
  context "the menu displays on startup" do
    let(:shell_output){ run_rotr_with_input() }
    it "should print the menu" do
      shell_output.should include(menu_text)
    end
  end
  context "the user selects 1" do
    let(:shell_output){ run_rotr_with_input("1") }
    it "should ask for drink name" do
      shell_output.should include("Input drink name:")
    end
  end
  context "the user selects 2" do
    let(:shell_output){ run_rotr_with_input("2") }
    it "should ask for ingredients" do
      shell_output.should include("Input Ingredients:")
    end
  end
  context "the user selects 3" do
    let(:shell_output){ run_rotr_with_input("3") }
    it "should show random cocktail" do
      shell_output.should include("Your Cocktail!")
    end
  end
  context "the user selects 4" do
    let(:shell_output){ run_rotr_with_input("4") }
    it "should show random shot" do
      shell_output.should include("Your Shot!")
    end
  end
  context "the user selects 5" do
    let(:shell_output){ run_rotr_with_input("5") }
    it "Should exit the program" do
      shell_output.should include("Thanks for using Ruby on the Rocks!")
    end
  end
end

