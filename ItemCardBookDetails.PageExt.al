pageextension 50105 "Item Card - Book Details" extends "Item Card"
{
    actions
    {
        addlast(Navigation)
        {
            group(Books)
            {
                action(BookDetails)
                {
                    RunObject = page "Book Details";
                    RunPageLink = "Item No." = field("No.");
                }
            }
        }
    }
}