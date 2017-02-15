class AdvancementsController < ApplicationController
  before_action :set_advancement, only: [:show, :edit, :update, :destroy]

  # GET /advancements
  # GET /advancements.json
  def index
    @advancements = Advancement.all
  end

  # GET /advancements/1
  # GET /advancements/1.json
  def show
  end

  # GET /advancements/new
  def new
    @advancement = Advancement.new
  end

  # GET /advancements/1/edit
  def edit
  end

  # POST /advancements
  # POST /advancements.json
  def create
    # @advancement = Advancement.new
    # @advancement.user_id = current_user.id
    # @advancement = Advancement.new(advancement_params)
    @advancement = Advancement.new({user_id: current_user.id})

    if @advancement.save
      run_advancement_cascade
      # scoutrank = Rank.create(rank: "Scout", advancement_id: @advancement.id)
      redirect_to action: "index", notice: "Advancement was successfully created."
    else
      render :new
    end
    # respond_to do |format|
    #   if @advancement.save
    #     format.html { redirect_to advancement_path, notice: 'Advancement was successfully created.' }
    #     format.json { render :index, status: :created, location: @advancement }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @advancement.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /advancements/1
  # PATCH/PUT /advancements/1.json
  def update
    respond_to do |format|
      if @advancement.update(advancement_params)
        format.html { redirect_to @advancement, notice: 'Advancement was successfully updated.' }
        format.json { render :show, status: :ok, location: @advancement }
      else
        format.html { render :edit }
        format.json { render json: @advancement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advancements/1
  # DELETE /advancements/1.json
  def destroy
    @advancement.destroy
    respond_to do |format|
      format.html { redirect_to advancements_url, notice: 'Advancement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advancement
      @advancement = Advancement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advancement_params
      params.require(:advancement).permit(:user_id)
    end

    def run_advancement_cascade
      create_rank_scout
      create_rank_tenderfoot
      create_rank_secondclass
      create_rank_firstclass
      create_rank_star
      create_rank_life
      create_rank_eagle
    end

    def create_rank_scout
      scoutrank = Rank.create(rank: "Scout", advancement_id: @advancement.id)
      req1 = Requirement.create(number: 1, rank_id: scoutrank.id, description: "Complete all subrequirements")
      req2 = Requirement.create(number: 2, rank_id: scoutrank.id, description: "After attending at least one Boy Scout troop meeting, do the following:")
      req3 = Requirement.create(number: 3, rank_id: scoutrank.id, description: "Complete all subrequirements")
      req4 = Requirement.create(number: 4, rank_id: scoutrank.id, description: "Complete all subrequirements")
      req5 = Requirement.create(number: 5, rank_id: scoutrank.id, description: "Demonstrate your knowledge of pocketknife safety.")
      req6 = Requirement.create(number: 6, rank_id: scoutrank.id, description: "With your parent or guardian, complete the exercises in the pamphlet How to Protect Your Children From Child Abuse: A Parent’s Guide and earn the Cyber Chip Award for your grade.")
      req7 = Requirement.create(number: 7, rank_id: scoutrank.id, description: "Since joining the troop and while working on the Scout rank, participate in a Scoutmaster conference.")
      Subrequirement.create(requirement_id: req1.id, part:"a", description: "Repeat from memory the Scout Oath, Scout Law, Scout motto, and Scout slogan. In your own words, explain their meaning.")
      Subrequirement.create(requirement_id: req1.id, part:"b", description: "Explain what Scout spirit is. Describe some ways you have shown Scout spirit by practicing the Scout Oath, Scout Law, Scout motto, and Scout slogan.")
      Subrequirement.create(requirement_id: req1.id, part:"c", description: "Demonstrate the Boy Scout sign, salute, and handshake. Explain when they should be used.")
      Subrequirement.create(requirement_id: req1.id, part:"d", description: "Describe the First Class Scout badge and tell what each part stands for. Explain the significance of the First Class Scout badge.")
      Subrequirement.create(requirement_id: req1.id, part:"e", description: "Repeat from memory the Outdoor Code. In your own words, explain what the Outdoor Code means to you.")
      Subrequirement.create(requirement_id: req1.id, part:"f", description: "Repeat from memory the Pledge of Allegiance. In your own words, explain its meaning.")
      Subrequirement.create(requirement_id: req2.id, part:"a", description: "Describe how the Scouts in the troop provide its leadership.")
      Subrequirement.create(requirement_id: req2.id, part:"b", description: "Describe the four steps of Boy Scout advancement.")
      Subrequirement.create(requirement_id: req2.id, part:"c", description: "Describe what the Boy Scout ranks are and how they are earned.")
      Subrequirement.create(requirement_id: req2.id, part:"d", description: "Describe what merit badges are and how they are earned.")
      Subrequirement.create(requirement_id: req3.id, part:"a", description: "Explain the patrol method. Describe the types of patrols that are used in your troop.")
      Subrequirement.create(requirement_id: req3.id, part:"b", description: "Become familiar with your patrol name, emblem, flag, and yell. Explain how these items create patrol spirit.")
      Subrequirement.create(requirement_id: req4.id, part:"a", description: "Show how to tie a square knot, two half-hitches, and a taut-line hitch. Explain how each knot is used.")
      Subrequirement.create(requirement_id: req4.id, part:"b", description: "Show the proper care of a rope by learning how to whip and fuse the ends of different kinds of rope.")
    end

    def create_rank_tenderfoot
      tenderfoot = Rank.create(rank: "Tenderfoot", advancement_id: @advancement.id)
      req1 = Requirement.create(number:1, rank_id: tenderfoot.id, description: "Complete all subrequirements for 1")
      req2 = Requirement.create(number:2, rank_id: tenderfoot.id, description: "Complete all subrequirements for 2")
      req3 = Requirement.create(number:3, rank_id: tenderfoot.id, description: "Complete all subrequirements for 3")
      req4 = Requirement.create(number:4, rank_id: tenderfoot.id, description: "Complete all subrequirements for 4")
      req5 = Requirement.create(number:5, rank_id: tenderfoot.id, description: "Complete all subrequirements for 5")
      req6 = Requirement.create(number:6, rank_id: tenderfoot.id, description: "Complete all subrequirements for 6")
      req7 = Requirement.create(number:7, rank_id: tenderfoot.id, description: "Complete all subrequirements for 7")
      Requirement.create(number: 8, rank_id: tenderfoot.id, description: "Describe the steps in Scouting’s Teaching EDGE method. Use the Teaching EDGE method to teach another person how to tie the square knot.")
      Requirement.create(number: 9, rank_id: tenderfoot.id, description: "Demonstrate Scout spirit by living the Scout Oath and Scout Law. Tell how you have done your duty to God and how you have lived four different points of the Scout Law in your everyday life.")
      Requirement.create(number: 10, rank_id: tenderfoot.id, description: "While working toward the Tenderfoot rank, and after completing Scout rank requirement 7, participate in a Scoutmaster conference.")
      Requirement.create(number: 11, rank_id: tenderfoot.id, description: "Successfully complete your board of review for the Tenderfoot rank")
      Subrequirement.create(requirement_id: req1.id, part: "a", description: "Present yourself to your leader, prepared for an overnight camping trip. Show the personal and camping gear you will use. Show the right way to pack and carry it.")
      Subrequirement.create(requirement_id: req1.id, part: "b", description: "Spend at least one night on a patrol or troop campout. Sleep in a tent you have helped pitch.")
      Subrequirement.create(requirement_id: req1.id, part: "c", description: "Tell how you practiced the Outdoor Code on a campout or outing.")
      Subrequirement.create(requirement_id: req2.id, part: "a", description: "On the campout, assist in preparing one of the meals. Tell why it is important for each patrol member to share in meal preparation and cleanup.")
      Subrequirement.create(requirement_id: req2.id, part: "b", description: "While on a campout, demonstrate the appropriate method of safely cleaning items used to prepare, serve, and eat a meal.")
      Subrequirement.create(requirement_id: req2.id, part: "c", description: "Explain the importance of eating together as a patrol.")
      Subrequirement.create(requirement_id: req3.id, part: "a", description: "Demonstrate a practical use of the square knot.")
      Subrequirement.create(requirement_id: req3.id, part: "b", description: "Demonstrate a practical use of two half-hitches.")
      Subrequirement.create(requirement_id: req3.id, part: "c", description: "Demonstrate a practical use of the taut-line hitch.")
      Subrequirement.create(requirement_id: req3.id, part: "d", description: "Demonstrate proper care, sharpening, and use of the knife, saw, and ax. Describe when each should be used.")
      Subrequirement.create(requirement_id: req4.id, part: "a", description: "Show first aid for the following: Simple cuts and scrapes, Blisters on the hand and foot, Minor (thermal/heat) burns or scalds (superficial, or first-degree), Bites or stings of insects and ticks, Venomous snakebite, Nosebleed, Frostbite and sunburn, Choking")
      Subrequirement.create(requirement_id: req4.id, part: "b", description: "Describe common poisonous or hazardous plants; identify any that grow in your local area or campsite location. Tell how to treat for exposure to them.")
      Subrequirement.create(requirement_id: req4.id, part: "c", description: "Tell what you can do while on a campout or other outdoor activity to prevent or reduce the occurrence of injuries or exposure listed in Tenderfoot requirements 4a and 4b.")
      Subrequirement.create(requirement_id: req4.id, part: "d", description: "Assemble a personal first-aid kit to carry with you on future campouts and hikes. Tell how each item in the kit would be used. ")
      Subrequirement.create(requirement_id: req5.id, part: "a", description: "Explain the importance of the buddy system as it relates to your personal safety on outings and in your neighborhood. Use the buddy system while on a troop or patrol outing.")
      Subrequirement.create(requirement_id: req5.id, part: "b", description: "Describe what to do if you become lost on a hike or campout.")
      Subrequirement.create(requirement_id: req5.id, part: "c", description: "Explain the rules of safe hiking, both on the highway and crosscountry, during the day and at night.")
      Subrequirement.create(requirement_id: req6.id, part: "a", description: "Record your best in the following tests: Pushups (Record the number done correctly in 60 seconds.), Situps or curl-ups (Record the number done correctly in 60 seconds.), Back-saver sit-and-reach (Record the distance stretched.), 1-mile walk/run (Record the time.)")
      Subrequirement.create(requirement_id: req6.id, part: "b", description: "Develop and describe a plan for improvement in each of the activities listed in Tenderfoot requirement 6a. Keep track of your activity for at least 30 days.")
      Subrequirement.create(requirement_id: req6.id, part: "c", description: "Show improvement (of any degree) in each activity listed in Tenderfoot requirement 6a after practicing for 30 days. Record results per requirement 6a.")
      Subrequirement.create(requirement_id: req7.id, part: "a", description: "Demonstrate how to display, raise, lower, and fold the U.S. flag.")
      Subrequirement.create(requirement_id: req7.id, part: "b", description: "Participate in a total of one hour of service in one or more service projects approved by your Scoutmaster. Explain how your service to others relates to the Scout slogan and Scout motto.")
    end

    def create_rank_secondclass
      secondclass = Rank.create(rank: "Second Class", advancement_id: @advancement.id)
      req1 = Requirement.create(rank_id: secondclass.id, number: 1, description: "Complete all subrequirements for 1")
      req2 = Requirement.create(rank_id: secondclass.id, number: 2, description: "Complete all subrequirements for 2")
      req3 = Requirement.create(rank_id: secondclass.id, number: 3, description: "Complete all subrequirements for 3")
      Requirement.create(rank_id: secondclass.id, number: 4, description: "Identify or show evidence of at least 10 kinds of wild animals (such as birds, mammals, reptiles, fish, or mollusks) found in your local area or camping location. You may show evidence by tracks, signs, or photographs you have taken.")
      req5 = Requirement.create(rank_id: secondclass.id, number: 5, description: "Complete all subrequirements for 5")
      req6 = Requirement.create(rank_id: secondclass.id, number: 6, description: "Complete all subrequirements for 6")
      req7 = Requirement.create(rank_id: secondclass.id, number: 7, description: "Complete all subrequirements for 7")
      req8 = Requirement.create(rank_id: secondclass.id, number: 8, description: "Complete all subrequirements for 8")
      req9 = Requirement.create(rank_id: secondclass.id, number: 9, description: "Complete all subrequirements for 9")
      Requirement.create(rank_id: secondclass.id, number: 10, description: "Demonstrate Scout spirit by living the Scout Oath and Scout Law. Tell how you have done your duty to God and how you have lived four different points of the Scout Law (not to include those used for Tenderfoot requirement 9) in your everyday life.")
      Requirement.create(rank_id: secondclass.id, number: 11, description: "While working toward the Second Class rank, and after completing Tenderfoot requirement 10, participate in a Scoutmaster conference.")
      Requirement.create(rank_id: secondclass.id, number: 12, description: "Successfully complete your board of review for the Second Class rank.")
      Subrequirement.create(requirement_id: req1.id, part: "a", description: "Since joining, participate in five separate troop/patrol activities, three of which include overnight camping. These five activities do not include troop or patrol meetings. On at least two of the three campouts, spend the night in a tent that you pitch or other structure that you help erect (such as a lean-to, snow cave, or tepee).")
      Subrequirement.create(requirement_id: req1.id, part: "b", description: "Explain the principles of Leave No Trace and tell how you practiced them on a campout or outing. This outing must be different from the one used for Tenderfoot requirement 1c.")
      Subrequirement.create(requirement_id: req1.id, part: "c", description: "On one of these campouts, select a location for your patrol site and recommend it to your patrol leader, senior patrol leader, or troop guide. Explain what factors you should consider when choosing a patrol site and where to pitch a tent.")
      Subrequirement.create(requirement_id: req2.id, part: "a", description: "Explain when it is appropriate to use a fire for cooking or other purposes and when it would not be appropriate to do so.")
      Subrequirement.create(requirement_id: req2.id, part: "b", description: "Use the tools listed in Tenderfoot requirement 3d to prepare tinder, kindling, and fuel wood for a cooking fire.")
      Subrequirement.create(requirement_id: req2.id, part: "c", description: "At an approved outdoor location and time, use the tinder, kindling, and fuel wood from Second Class requirement 2b to demonstrate how to build a fire. Unless prohibited by local fire restrictions, light the fire. After allowing the flames to burn safely for at least two minutes, safely extinguish the flames with minimal impact to the fire site.")
      Subrequirement.create(requirement_id: req2.id, part: "d", description: "Explain when it is appropriate to use a lightweight stove and when it is appropriate to use a propane stove. Set up a lightweight stove or propane stove. Light the stove, unless prohibited by local fire restrictions. Describe the safety procedures for using these types of stoves.")
      Subrequirement.create(requirement_id: req2.id, part: "e", description: "On one campout, plan and cook one hot breakfast or lunch, selecting foods from MyPlate or the current USDA nutritional model. Explain the importance of good nutrition. Demonstrate how to transport, store, and prepare the foods you selected.")
      Subrequirement.create(requirement_id: req2.id, part: "f", description: "Demonstrate tying the sheet bend knot. Describe a situation in which you would use this knot.")
      Subrequirement.create(requirement_id: req2.id, part: "g", description: "Demonstrate tying the bowline knot. Describe a situation in which you would use this knot.")
      Subrequirement.create(requirement_id: req3.id, part: "a", description: "Demonstrate how a compass works and how to orient a map. Use a map to point out and tell the meaning of five map symbols.")
      Subrequirement.create(requirement_id: req3.id, part: "b", description: "Using a compass and map together, take a 5-mile hike (or 10 miles by bike) approved by your adult leader and your parent or guardian.2")
      Subrequirement.create(requirement_id: req3.id, part: "c", description: "Describe some hazards or injuries that you might encounter on your hike and what you can do to help prevent them.2")
      Subrequirement.create(requirement_id: req3.id, part: "d", description: "Demonstrate how to find directions during the day and at night without using a compass or an electronic device.")
      Subrequirement.create(requirement_id: req5.id, part: "a", description: "Tell what precautions must be taken for a safe swim.")
      Subrequirement.create(requirement_id: req5.id, part: "b", description: "Demonstrate your ability to pass the BSA beginner test: Jump feet first into water over your head in depth, level off and swim 25 feet on the surface, stop, turn sharply, resume swimming, then return to your starting place.")
      Subrequirement.create(requirement_id: req5.id, part: "c", description: "Demonstrate water rescue methods by reaching with your arm or leg, by reaching with a suitable object, and by throwing lines and objects.")
      Subrequirement.create(requirement_id: req5.id, part: "d", description: "Explain why swimming rescues should not be attempted when a reaching or throwing rescue is possible. Explain why and how a rescue swimmer should avoid contact with the victim.")
      Subrequirement.create(requirement_id: req6.id, part: "a", description: "Demonstrate first aid for the following: * Object in the eye, * Bite of a warm-blooded animal, * Puncture wounds from a splinter, nail, and fishhook, * Serious burns (partial thickness, or second-degree), * Heat exhaustion, * Shock, * Heatstroke, dehydration, hypothermia, and hyperventilation")
      Subrequirement.create(requirement_id: req6.id, part: "b", description: "Show what to do for “hurry” cases of stopped breathing, stroke, severe bleeding, and ingested poisoning.")
      Subrequirement.create(requirement_id: req6.id, part: "c", description: "Tell what you can do while on a campout or hike to prevent or reduce the occurrence of the injuries listed in Second Class requirements 6a and 6b.")
      Subrequirement.create(requirement_id: req6.id, part: "d", description: "Explain what to do in case of accidents that require emergency response in the home and backcountry. Explain what constitutes an emergency and what information you will need to provide to a responder.")
      Subrequirement.create(requirement_id: req6.id, part: "e", description: "Tell how you should respond if you come upon the scene of a vehicular accident.")
      Subrequirement.create(requirement_id: req7.id, part: "a", description: "After completing Tenderfoot requirement 6c, be physically active at least 30 minutes each day for five days a week for four weeks. Keep track of your activities.")
      Subrequirement.create(requirement_id: req7.id, part: "b", description: "Share your challenges and successes in completing Second Class requirement 7a. Set a goal for continuing to include physical activity as part of your daily life and develop a plan for doing so.")
      Subrequirement.create(requirement_id: req7.id, part: "c", description: "Participate in a school, community, or troop program on the dangers of using drugs, alcohol, and tobacco and other practices that could be harmful to your health. Discuss your participation in the program with your family, and explain the dangers of substance addictions. Report to your Scoutmaster or other adult leader in your troop about which parts of the Scout Oath and Scout Law relate to what you learned.")
      Subrequirement.create(requirement_id: req8.id, part: "a", description: "Participate in a flag ceremony for your school, religious institution, chartered organization, community, or Scouting activity.")
      Subrequirement.create(requirement_id: req8.id, part: "b", description: "Explain what respect is due the flag of the United States.")
      Subrequirement.create(requirement_id: req8.id, part: "c", description: "With your parents or guardian, decide on an amount of money that you would like to earn, based on the cost of a specific item you would like to purchase. Develop a written plan to earn the amount agreed upon and follow that plan; it is acceptable to make changes to your plan along the way. Discuss any changes made to your original plan and whether you met your goal.")
      Subrequirement.create(requirement_id: req8.id, part: "d", description: "At a minimum of three locations, compare the cost of the item for which you are saving to determine the best place to purchase it. After completing Second Class requirement 8c, decide if you will use the amount that you earned as originally intended, save all or part of it, or use it for another purpose.")
      Subrequirement.create(requirement_id: req8.id, part: "e", description: "Participate in two hours of service through one or more service projects approved by your Scoutmaster. Tell how your service to others relates to the Scout Oath.")
      Subrequirement.create(requirement_id: req9.id, part: "a", description: "Explain the three R’s of personal safety and protection.")
      Subrequirement.create(requirement_id: req9.id, part: "b", description: "Describe bullying; tell what the appropriate response is to someone who is bullying you or another person.")
    end

    def create_rank_firstclass
      firstclass = Rank.create(rank: "First Class", advancement_id: @advancement.id)
      req1 = Requirement.create(number: 1, rank_id: firstclass.id, description: "Complete all subrequirements for 1")
      req2 = Requirement.create(number: 2, rank_id: firstclass.id, description: "Complete all subrequirements for 2")
      req3 = Requirement.create(number: 3, rank_id: firstclass.id, description: "Complete all subrequirements for 3")
      req4 = Requirement.create(number: 4, rank_id: firstclass.id, description: "Complete all subrequirements for 4")
      req5 = Requirement.create(number: 5, rank_id: firstclass.id, description: "Complete all subrequirements for 5")
      req6 = Requirement.create(number: 6, rank_id: firstclass.id, description: "Complete all subrequirements for 6")
      req7 = Requirement.create(number: 7, rank_id: firstclass.id, description: "Complete all subrequirements for 7")
      req8 = Requirement.create(number: 8, rank_id: firstclass.id, description: "Complete all subrequirements for 8")
      req9 = Requirement.create(number: 9, rank_id: firstclass.id, description: "Complete all subrequirements for 9")
      Requirement.create(number: 10, rank_id: firstclass.id, description: "Tell someone who is eligible to join Boy Scouts, or an inactive Boy Scout, about your Scouting activities. Invite him to an outing, activity, service project, or meeting. Tell him how to join, or encourage the inactive Boy Scout to become active. Share your efforts with your Scoutmaster or other adult leader.")
      Requirement.create(number: 11, rank_id: firstclass.id, description: "Demonstrate Scout spirit by living the Scout Oath and Scout Law. Tell how you have done your duty to God and how you have lived four different points of the Scout Law (different from those points used for previous ranks) in your everyday life.")
      Requirement.create(number: 12, rank_id: firstclass.id, description: "While working toward the First Class rank, and after completing Second Class requirement 11, participate in a Scoutmaster conference.")
      Requirement.create(number: 13, rank_id: firstclass.id, description: "Successfully complete your board of review for the First Class rank.")
      Subrequirement.create(requirement_id: req1.id, part: "a", description: "Since joining, participate in 10 separate troop/patrol activities, six of which include overnight camping. These 10 activities do not include troop or patrol meetings. On at least five of the six campouts, spend the night in a tent that you pitch or other structure that you help erect (such as a lean-to, snow cave, or tepee).")
      Subrequirement.create(requirement_id: req1.id, part: "b", description: "Explain each of the principles of Tread Lightly! and tell how you practiced them on a campout or outing. This outing must be different from the ones used for Tenderfoot requirement 1c and Second Class requirement 1b.")
      Subrequirement.create(requirement_id: req2.id, part: "a", description: "Help plan a menu for one of the above campouts that includes at least one breakfast, one lunch, and one dinner, and that requires cooking at least two of the meals. Tell how the menu includes the foods from MyPlate or the current USDA nutritional model and how it meets nutritional needs for the planned activity or campout.")
      Subrequirement.create(requirement_id: req2.id, part: "b", description: "Using the menu planned in First Class requirement 2a, make a list showing a budget and the food amounts needed to feed three or more boys. Secure the ingredients.")
      Subrequirement.create(requirement_id: req2.id, part: "c", description: "Show which pans, utensils, and other gear will be needed to cook and serve these meals.")
      Subrequirement.create(requirement_id: req2.id, part: "d", description: "Demonstrate the procedures to follow in the safe handling and storage of fresh meats, dairy products, eggs, vegetables, and other perishable food products. Show how to properly dispose of camp garbage, cans, plastic containers, and other rubbish.")
      Subrequirement.create(requirement_id: req2.id, part: "e", description: "On one campout, serve as cook. Supervise your assistant(s) in using a stove or building a cooking fire. Prepare the breakfast, lunch, and dinner planned in First Class requirement 2a. Supervise the cleanup.")
      Subrequirement.create(requirement_id: req3.id, part: "a", description: "Discuss when you should and should not use lashings.")
      Subrequirement.create(requirement_id: req3.id, part: "b", description: "Demonstrate tying the timber hitch and clove hitch.")
      Subrequirement.create(requirement_id: req3.id, part: "c", description: "Demonstrate tying the square, shear, and diagonal lashings by joining two or more poles or staves together.")
      Subrequirement.create(requirement_id: req3.id, part: "d", description: "Use lashings to make a useful camp gadget or structure.")
      Subrequirement.create(requirement_id: req4.id, part: "a", description: "Using a map and compass, complete an orienteering course that covers at least one mile and requires measuring the height and/ or width of designated items (tree, tower, canyon, ditch, etc.).")
      Subrequirement.create(requirement_id: req4.id, part: "b", description: "Demonstrate how to use a handheld GPS unit, GPS app on a smartphone, or other electronic navigation system. Use GPS to find your current location, a destination of your choice, and the route you will take to get there. Follow that route to arrive at your destination.")
      Subrequirement.create(requirement_id: req5.id, part: "a", description: "Identify or show evidence of at least 10 kinds of native plants found in your local area or campsite location. You may show evidence by identifying fallen leaves or fallen fruit that you find in the field, or as part of a collection you have made, or by photographs you have taken.")
      Subrequirement.create(requirement_id: req5.id, part: "b", description: "Identify two ways to obtain a weather forecast for an upcoming activity. Explain why weather forecasts are important when planning for an event.")
      Subrequirement.create(requirement_id: req5.id, part: "c", description: "Describe at least three natural indicators of impending hazardous weather, the potential dangerous events that might result from such weather conditions, and the appropriate actions to take.")
      Subrequirement.create(requirement_id: req5.id, part: "d", description: "Describe extreme weather conditions you might encounter in the outdoors in your local geographic area. Discuss how you would determine ahead of time the potential risk of these types of weather dangers, alternative planning considerations to avoid such risks, and how you would prepare for and respond to those weather conditions.")
      Subrequirement.create(requirement_id: req6.id, part: "a", description: "Successfully complete the BSA swimmer test.3")
      Subrequirement.create(requirement_id: req6.id, part: "b", description: "Tell what precautions must be taken for a safe trip afloat.")
      Subrequirement.create(requirement_id: req6.id, part: "c", description: "Identify the basic parts of a canoe, kayak, or other boat. Identify the parts of a paddle or an oar.")
      Subrequirement.create(requirement_id: req6.id, part: "d", description: "Describe proper body positioning in a watercraft, depending on the type and size of the vessel. Explain the importance of proper body position in the boat.")
      Subrequirement.create(requirement_id: req6.id, part: "e", description: "With a helper and a practice victim, show a line rescue both as tender and as rescuer. (The practice victim should be approximately 30 feet from shore in deep water.)")
      Subrequirement.create(requirement_id: req7.id, part: "a", description: "Demonstrate bandages for a sprained ankle and for injuries on the head, the upper arm, and the collarbone.")
      Subrequirement.create(requirement_id: req7.id, part: "b", description: "By yourself and with a partner, show how to: * Transport a person from a smoke-filled room, * Transport for at least 25 yards a person with a sprained ankle.")
      Subrequirement.create(requirement_id: req7.id, part: "c", description: "Tell the five most common signals of a heart attack. Explain the steps (procedures) in cardiopulmonary resuscitation (CPR).")
      Subrequirement.create(requirement_id: req7.id, part: "d", description: "Tell what utility services exist in your home or meeting place. Describe potential hazards associated with these utilities and tell how to respond in emergency situations.")
      Subrequirement.create(requirement_id: req7.id, part: "e", description: "Develop an emergency action plan for your home that includes what to do in case of fire, storm, power outage, and water outage.")
      Subrequirement.create(requirement_id: req7.id, part: "f", description: "Explain how to obtain potable water in an emergency.")
      Subrequirement.create(requirement_id: req8.id, part: "a", description: "After completing Second Class requirement 7a, be physically active at least 30 minutes each day for five days a week for four weeks. Keep track of your activities.")
      Subrequirement.create(requirement_id: req8.id, part: "b", description: "Share your challenges and successes in completing First Class requirement 8a. Set a goal for continuing to include physical activity as part of your daily life and develop a plan for doing so.")
      Subrequirement.create(requirement_id: req9.id, part: "a", description: "Visit and discuss with a selected individual approved by your leader (for example, an elected official, judge, attorney, civil servant, principal, or teacher) the constitutional rights and obligations of a U.S. citizen.")
      Subrequirement.create(requirement_id: req9.id, part: "b", description: "Investigate an environmental issue affecting your community. Share what you learned about that issue with your patrol or troop. Tell what, if anything, could be done by you or your community to address the concern.")
      Subrequirement.create(requirement_id: req9.id, part: "c", description: "On a Scouting or family outing, take note of the trash and garbage you produce. Before your next similar outing, decide how you can reduce, recycle, or repurpose what you take on that outing, and then put those plans into action. Compare your results.")
      Subrequirement.create(requirement_id: req9.id, part: "d", description: "Participate in three hours of service through one or more service projects approved by your Scoutmaster. The project(s) must not be the same service project(s) used for Tenderfoot requirement 7b and Second Class requirement 8e. Explain how your service to others relates to the Scout Law.")
    end

    def create_rank_star
      star = Rank.create(rank: "Star", advancement_id: @advancement.id)
      Requirement.create( number: 1, rank_id: star.id, description: "Be active in your troop for at least four months as a First Class Scout.")
      Requirement.create( number: 2, rank_id: star.id, description: "As a First Class Scout, demonstrate Scout spirit by living the Scout Oath and Scout Law. Tell how you have done your duty to God and how you have lived the Scout Oath and Scout Law in your everyday life.")
      Requirement.create( number: 3, rank_id: star.id, description: "Earn six merit badges, including any four from the required list for Eagle. You may choose any of the 17 merit badges on the required list for Eagle to fulfill this requirement.")
      Requirement.create( number: 4, rank_id: star.id, description: "While a First Class Scout, participate in six hours of service through one or more service projects approved by your Scoutmaster.")
      Requirement.create( number: 5, rank_id: star.id, description: "While a First Class Scout, serve actively in your troop for four months in one or more of the following positions of responsibility (or carry out a Scoutmaster-approved leadership project to help the troop): Patrol leader, assistant senior patrol leader, senior patrol leader, troop guide, Order of the Arrow troop representative, den chief, scribe, librarian, historian, quartermaster, bugler, junior assistant Scoutmaster, chaplain aide, instructor, webmaster, or outdoor ethics guide.")
      Requirement.create( number: 6, rank_id: star.id, description: "With your parent or guardian, complete the exercisesin the pamphlet How to Protect Your Children From Child Abuse: A Parent’s Guide and earn the Cyber Chip award for your grade.")
      Requirement.create( number: 7, rank_id: star.id, description: "While a First Class Scout, participate in a Scoutmaster conference.")
      Requirement.create( number: 8, rank_id: star.id, description: "Successfully complete your board of review for the Star rank.")
    end

    def create_rank_life
      life = Rank.create(rank: "Life", advancement_id: @advancement.id)
      Requirement.create(number: 1, rank_id: life.id, description: "Be active in your troop for at least six months as a Star Scout")
      Requirement.create(number: 2, rank_id: life.id, description: "As a Star Scout, demonstrate Scout spirit by living the Scout Oath and Scout Law. Tell how you have done your duty to God and how you have lived the Scout Oath and Scout Law in your everyday life")
      Requirement.create(number: 3, rank_id: life.id, description: "Earn five more merit badges (so that you have 11 in all), including any three additional badges from the required list for Eagle")
      Requirement.create(number: 4, rank_id: life.id, description: "While a Star Scout, participate in six hours of service through one or more service projects approved by your Scoutmaster. At least three hours of this service must be conservation-related")
      Requirement.create(number: 5, rank_id: life.id, description: "While a Star Scout, serve actively in your troop for six months in one or more troop positions of responsibility (or carry out a Scoutmaster-approved leadership project to help the troop)")
      req6 = Requirement.create( number: 6, rank_id: life.id, description: "While a Star Scout, use the Teaching EDGE method to teach another Scout (preferably younger than you) the skills from ONE of the following choices, so that he is prepared to pass those requirements to his Scoutmaster’s satisfaction")
      Requirement.create(number: 7, rank_id: life.id, description: "While a Star Scout, participate in a Scoutmaster conference")
      Requirement.create(number: 8, rank_id: life.id, description: "Successfully complete your board of review for the Life rank.")
      Subrequirement.create(requirement_id: req6.id, part: "a",  description: "Tenderfoot 4a and 4b (first aid)")
      Subrequirement.create(requirement_id: req6.id, part: "b",  description: "Second Class 2b, 2c, and 2d (cooking/tools)")
      Subrequirement.create(requirement_id: req6.id, part: "c",  description: "Second Class 3a and 3d (navigation)")
      Subrequirement.create(requirement_id: req6.id, part: "d",  description: "First Class 3a, 3b, 3c, and 3d (tools)")
      Subrequirement.create(requirement_id: req6.id, part: "e",  description: "First Class 4a and 4b (navigation)")
      Subrequirement.create(requirement_id: req6.id, part: "f",  description: "Second Class 6a and 6b (first aid)")
      Subrequirement.create(requirement_id: req6.id, part: "g",  description: "First Class 7a and 7b (first aid)")
      Subrequirement.create(requirement_id: req6.id, part: "h",  description: "Three requirements from one of the required Eagle merit badges, as approved by your Scoutmaster")
    end

    def create_rank_eagle
      eagle = Rank.create(rank: "Eagle", advancement_id: @advancement.id)
      Requirement.create(number: 1, rank_id: eagle.id, description: "Be active in your troop for at least six months as a Life Scout.")
      Requirement.create(number: 2, rank_id: eagle.id, description: "As a Life Scout, demonstrate Scout Spirit by living the Scout Oath and Scout Law. Tell how you have done your duty to God, how you have lived the Scout Oath and Scout Law in your everyday life, and how your understanding of the Scout Oath and Scout Law will guide your life in the future. List on your Eagle Scout Rank Application the names of individuals who know you personally and would be willing to provide a recommendation on your behalf, including parents/guardians, religious (if not affiliated with an organized religion, then the parent or guardian provides this reference), educational, employer (if employed), and two other references.")
      Requirement.create(number: 3, rank_id: eagle.id, description: "Earn a total of 21 merit badges including 13 Eagle required merit badges.")
      Requirement.create(number: 4, rank_id: eagle.id, description: "While a Life Scout, serve actively in your troop for six months in one or more of the following positions of responsibility: Boy Scout troop. Patrol leader, assistant senior patrol leader, senior patrol leader, troop guide, Order of the Arrow troop representative, den chief, scribe, librarian, historian, quartermaster, junior assistant Scoutmaster, chaplain aide, instructor, webmaster, or outdoor ethics guide.")
      Requirement.create(number: 5, rank_id: eagle.id, description: "While a Life Scout, plan, develop, and give leadership to others in a service project helpful to any religious institution, any school, or your community. (The project must benefit an organization other than the Boy Scouts of America.) A project proposal must be approved by the organization benefiting from the effort, your Scoutmaster and unit committee, and the council or district before you start. You must use the Eagle Scout Service Project Workbook, BSA publication No. 512-927, in meeting this requirement. (To learn more about the Eagle Scout service project, see the Guide to Advancement, topics 9.0.2.0 through 9.0.2.16.)")
      Requirement.create(number: 6, rank_id: eagle.id, description: "While a Life Scout, participate in a Scoutmaster conference. In preparation for your board of review, prepare and attach to your Eagle Scout Rank Application a statement of your ambitions and life purpose and a listing of positions held in your religious institution, school, camp, community, or other organizations, during which you demonstrated leadership skills. Include honors and awards received during this service")
      Requirement.create(number: 7, rank_id: eagle.id, description: "Successfully complete your board of review for the Eagle Scout rank.10 (This requirement may be met after age 18, in accordance with Guide to Advancement topic 8.0.3.1.11).")
    end


end
