table 50102 "Book Details"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(2; "Line No."; Integer) { }
        field(20; ISBN; Text[13]) { }
        field(30; Title; Text[100]) { }
        field(40; Author; Text[100]) { }
        field(50; "Publication Date"; Date) { }
        field(60; Excerpt; Text[2048]) { }
        field(70; "Page Count"; Integer) { }
    }

    keys
    {
        key(PK; "Item No.", "Line No.")
        {
            Clustered = true;
        }
        key(ISBN; ISBN)
        {
            Unique = true; //no repetir isbn
        }
    }
}