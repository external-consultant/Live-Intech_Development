pageextension 50133 BSOExtended extends "Blanket Sales Order"
{
    layout
    {
        addlast(General)
        {

            field("Required Approval"; Rec."Required Approval")
            {
                ApplicationArea = All;
                Description = 'T50268';
                ToolTip = 'Specifies the value of the Required Approval field.', Comment = '%';
            }
        }
    }

}