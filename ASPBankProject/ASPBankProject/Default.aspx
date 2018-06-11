<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPBankProject.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ClientsInfoValidation</title>
</head>
<body>
    <form id="form1" runat="server" >
    <div style="text-align:center">
    
        <asp:Label ID="Label1" runat="server" Text="Validation of potential customers" Font-Size="20" Font-Italic="true"></asp:Label>
        
    
    </div>
    <div>
        <br />
        <asp:Label ID="Label3" runat="server" Text="SelectTheInputFile" Width="250"></asp:Label>
        <asp:FileUpload id="FUpFile" runat="server"  ></asp:FileUpload>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FUpFile"
            ErrorMessage="Select the input file" ForeColor="Brown" ValidationGroup="g1"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="SelectTheBlackListFile" Width="250"></asp:Label>
        <asp:FileUpload id="FUpBlack" runat="server"  ></asp:FileUpload>
        <%--<asp:TextBox ID="T1" runat="server" Text="fdf"></asp:TextBox>  --%>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FUpBlack"
            ErrorMessage="Select the black-list file" ForeColor="Brown" ValidationGroup="g1"></asp:RequiredFieldValidator>
        <br />
        <br />
         <asp:Button id="ButStart" runat="server" Text="Start validation" OnClick="ButStart_Click" ForeColor="darkblue" Font-Size="11" Font-Bold="true"
            OnClientClick="return confirm ('Selected files will be dounloaded on the server')"  ValidationGroup="g1"></asp:Button>

        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Text="show results on the page" Value="1" Selected="True"></asp:ListItem>
            <asp:ListItem Text="write results into the file" Value="2"></asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />   
    </div>
    <div>
    <div style="float:left">
        <asp:Label runat="server" Width="350"></asp:Label>    <%--  for correct visualization when the window size is low   --%>
         <asp:Repeater ID="Repeater1" runat="server">
              <HeaderTemplate>
                <div style="width:348px; background-color:DarkGray; text-align:center; border-style:solid; border-width:thin"> 
                    <asp:Label runat="server" Text="Not unique TAXID" Font-Size="16" Font-Bold="true"></asp:Label> 
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div style="width: 350px; background-color:aqua">
                    <asp:Label  runat="server" Text='<%# Eval("N1") %>' Width="100"></asp:Label>
                    <asp:Label  runat="server" Text='<%# Eval("N2") %>' Width="100"></asp:Label>
                    <asp:Label  runat="server" Text='<%# Eval("N3") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N4") %>'></asp:Label>
                    <br />
                </div>
            </ItemTemplate>
             <AlternatingItemTemplate>
                <div style="width: 350px; background-color:LightSkyBlue">
                    <asp:Label  runat="server" Text='<%# Eval("N1") %>' Width="100"></asp:Label>
                    <asp:Label  runat="server" Text='<%# Eval("N2") %>' Width="100"></asp:Label>
                    <asp:Label  runat="server" Text='<%# Eval("N3") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N4") %>'></asp:Label>
                    <br />
                </div>
            </AlternatingItemTemplate>
        </asp:Repeater>
    </div>

   
    
    <div style="float:right"> 
        <asp:Label runat="server" Width="350"></asp:Label>    <%--  for correct visualization when the window size is low   --%>
        <asp:Repeater ID="Repeater2" runat="server">
            <HeaderTemplate>
                <div style="width:348px; background-color:DarkGray; text-align:center; border-style:solid; border-width:thin"> 
                    <asp:Label runat="server" Text="Not valid TAXID" Font-Size="16" Font-Bold="true"></asp:Label> 
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div style="width:350px; background-color:aqua">
                    <asp:Label runat="server" Text='<%# Eval("N1") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N2") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N3") %>' ></asp:Label>
                </div>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div style="width:350px; background-color:LightSkyBlue">
                    <asp:Label runat="server" Text='<%# Eval("N1") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N2") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N3") %>' ></asp:Label>
                </div>
            </AlternatingItemTemplate>
        </asp:Repeater>
    </div>

    <div style=" width:400px; margin: 0 auto">
        <asp:Label runat="server" Width="400"></asp:Label>    <%--  for correct visualization when the window size is low   --%>
        <asp:Repeater ID="Repeater3" runat="server">
            <HeaderTemplate>
                <div style="width:398px; background-color:DarkGray; text-align:center; border-style:solid; border-width:thin"> 
                    <asp:Label runat="server" Text="In the Black list" Font-Size="16" Font-Bold="true"></asp:Label> 
                </div>
            </HeaderTemplate>    
            <ItemTemplate>
                <div style="width: 400px; background-color:SandyBrown">
                    <asp:Label runat="server" Text='<%# Eval("N1") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N2") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N3") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N4") %>' ></asp:Label>
                </div>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div style="width: 400px; background-color:DarkOrange">
                    <asp:Label runat="server" Text='<%# Eval("N1") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N2") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N3") %>' Width="100"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("N4") %>' ></asp:Label>
                </div>
            </AlternatingItemTemplate>
        </asp:Repeater>
    </div>
    
    </div>
    </form>


</body>
</html>
