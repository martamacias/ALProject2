page 50100 "Book Details"
{
    PageType = List;
    SourceTable = "Book Details";
    AutoSplitKey = true; // no. lineas auto

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; "Item No.") //nombre, source
                {
                    Visible = false;
                }
                field(Title; Title) { }
                field(ISBN; ISBN) { }
                field(Excerpt; Excerpt) { }
                field(Author; Author) { }
                field("Publication Date"; "Publication Date") { }
                field("Page Count"; "Page Count") { }
            }
        }
    }
}