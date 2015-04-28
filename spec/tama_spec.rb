require('rspec')
require('tama')

describe(Tamagotchi) do
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe("#age") do
    it("returns how long your tamagotchi has been alive") do
      my_pet = Tamagotchi.new("buddy")
      sleep(1)
      expect(my_pet.age()).to eq("Your Tamagotchi has been alive for: 0 days, 0 minutes, and 1 seconds")
    end
  end

  describe(".check_in") do
    it("depletes food, sleep, and activity based on time passed") do
      my_pet = Tamagotchi.new("pleasework")
      sleep(18)
      my_pet.check_in()
      expect(my_pet.food_level()).to(eq(9))
    end
  end

  describe(".alive?") do
    it("checks to see if your pet is still alive, if it is it outputs the current vitals") do
      my_pet = Tamagotchi.new("Hobbes")
      expect(my_pet.alive?()).to(eq("Your pet is still alive!!!.....for now.\n
      food level: 10 \n
      @sleep_level: 10"))
    end
  end

  describe(":kill") do
    it("kills them!") do
      my_pet = Tamagotchi.new("EvilBaby")
      my_pet.kill()
      expect(my_pet.alive?()).to(eq("You killed EvilBaby!"))
    end
  end
end
