require 'ruby-progressbar'

namespace :dnd do
  desc "Generate DND database"
  task generate: :environment do
    total = 10000
    batch_size = 1000
    prefix = '91'
    progress_bar = ProgressBar.create( :format         => '%a %e %bᗧ%i %p%% %t',
                                       :progress_mark  => ' ',
                                       :remainder_mark => '･',
                                       :starting_at    => 0,
                                       :total 		   => total)
    (1..total/batch_size).each do |series|
      (1..batch_size).each do |index|
        Registry.transaction do
          number = series*index
          Registry.create(
            phone_number: "#{prefix}#{"%08d"%number}",
            cat_1: [true, false].sample,
            cat_2: [true, false].sample,
            cat_3: [true, false].sample,
            cat_4: [true, false].sample,
            cat_5: [true, false].sample,
            cat_6: [true, false].sample,
            cat_7: [true, false].sample,
            all: [true, false].sample
          )
        end
        progress_bar.progress += 100 if index % 100 == 0
        #print '.' if index % 100 == 0
      end
      #print "|#{series}|"

    end
    print "\n"
  end

end
