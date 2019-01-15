class NeopetsController < ApplicationController
  before_action :find_neo_params, only: [:show,:delete,:play_song]
  before_action :find_user_params, only: [:index,:edit,:update]

  def index
    @neopets = Neopet.all
  end


  def new
    @neopet = Neopet.new
  end

  def show
  end

  def create
    @neopet = Neopet.create(neopet_params(:name,:vegan))
    redirect_to neopet_path(@neopet)
  end

  def edit
    @neopet = Neopet.find(params[:pet_id])

  end

  def update
    @neopet = Neopet.find(params[:pet_id])
    @neopet.user = @user
    @user.neopets << @neopet
    # binding.pry
    redirect_to user_path(@user)
  end

  def delete
    @neopet.destroy
    redirect_to neopets_path
  end

  def play_song
    play_music_and_change_happiness
    render 'show'
  end


  private

    def neopet_params(*args)
      params.require(:neopet).permit(args)
    end

    def find_neo_params
      @neopet = Neopet.find(params[:id])
    end

    def find_user_params
      @user = User.find(params[:id])
    end



    def play_music_and_change_happiness
      RSpotify.authenticate("71c2cbbd78344649836922adbd59e972", "637ac67349b84fbf9d3adc089b146366")
      recommendations = RSpotify::Recommendations.generate(seed_genres: [@neopet.music_taste], limit: 1)
      song_link =  recommendations.tracks[0].preview_url
      url = song_link
      if url
        filename = 'track1'
        file = PullTempfile.pull_tempfile(url: url, original_filename: filename)
        system "afplay -t 10 #{file.path}"
        file.unlink
        happy = @neopet.happiness + 50
        @neopet.update(happiness: happy)
      else
        flash.now[:notice] = "I don't feel like listening to music right now! Try again later!"

        happy = @neopet.happiness - 50
        @neopet.update(happiness: happy)


      end
    end

  end
