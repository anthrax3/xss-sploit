module Xss
    module Ui
        module Console
            module Shell
                module Commands

                    class Wiki
                        include Xss::Ui::Console::Shell::Commands

                        def name
                            'Wiki'
                        end

                        #
                        # A hash of inner commands in exploit
                        # The hash keys:
                        #
                        def commands
                            {

                            }
                        end

                    end

                end
            end
        end
    end
end
