package ensf480.term_project.domain.AdminStrategies;

import javax.swing.*;

import ensf480.term_project.domain.GUIPages.LoginGUI;
import ensf480.term_project.domain.Users.RegisteredUser;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

public class AdminGUIPage extends JPanel {

    public AdminGUIPage() {
        // Set up the main panel
        setLayout(new BorderLayout());

        // Create components
        JPanel topBarPanel = createTopBarPanel();
        JPanel gridPanel = createGridPanel();

        // Add components to the main panel
        add(topBarPanel, BorderLayout.NORTH);
        add(gridPanel, BorderLayout.CENTER);
    }

    private JPanel createTopBarPanel() {
        JPanel topBarPanel = new JPanel();
        topBarPanel.setBackground(Color.LIGHT_GRAY);

        // Create sign-out button
        JButton signOutButton = new JButton("Sign Out");
        signOutButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Perform sign-out actions
                JOptionPane.showMessageDialog(null, "Signing out...");
                CardLayout cardLayout = (CardLayout) getParent().getLayout();
                cardLayout.show(getParent(), "login");
            }
        });

        topBarPanel.add(signOutButton);

        return topBarPanel;
    }

    private JPanel createGridPanel() {
        JPanel gridPanel = new JPanel(new GridLayout(2, 2, 10, 10));
        gridPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        // Create buttons for each option
        JButton manageFlightButton = new JButton("Manage Flight");
        JButton manageAircraftButton = new JButton("Manage Aircraft");
        JButton printUserButton = new JButton("Print Users");
        JButton browsePassengersButton = new JButton("Browse Passengers");

        // Add action listeners to the buttons
        manageFlightButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Add logic to handle "Manage Flight" action
                JOptionPane.showMessageDialog(null, "Managing Flight...");
                CardLayout cardLayout = (CardLayout) getParent().getLayout();
                cardLayout.show(getParent(), "flightManager");
            }
        });

        manageAircraftButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Add logic to handle "Manage Aircraft" action
                JOptionPane.showMessageDialog(null, "Managing Aircraft...");
                CardLayout cardLayout = (CardLayout) getParent().getLayout();
                cardLayout.show(getParent(), "aircraftManager");
            }
        });

        printUserButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                List<RegisteredUser> users = LoginGUI.getLoggedInAdmin().printUsers();
                List<String> usernames = new ArrayList<>();

                // Extract usernames from RegisteredUser objects and add them to the list
                for (RegisteredUser user : users) {
                    usernames.add(user.getUsername());
                }

                JList<String> userList = new JList<>(usernames.toArray(new String[0]));

                // Create a scroll pane for the JList
                JScrollPane scrollPane = new JScrollPane(userList);

                JFrame popupFrame = new JFrame("All Users");
                popupFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
                popupFrame.getContentPane().add(scrollPane);
                popupFrame.setSize(300, 200);
                popupFrame.setLocationRelativeTo(null); // Center the frame on the screen
                popupFrame.setVisible(true);
            }
        });


        browsePassengersButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Add logic to handle "Browse Passengers" action
                JOptionPane.showMessageDialog(null, "Browsing Passengers...");
                CardLayout cardLayout = (CardLayout) getParent().getLayout();
                cardLayout.show(getParent(), "browsePassengerFlights");
            }
        });

        // Add buttons to the grid panel
        gridPanel.add(manageFlightButton);
        gridPanel.add(manageAircraftButton);
        gridPanel.add(printUserButton);
        gridPanel.add(browsePassengersButton);

        return gridPanel;
    }
}
