-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');


-- ========================================
-- service_projects Table
-- ========================================

CREATE TABLE service_projects (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    project_date DATE,

    CONSTRAINT fk_service_projects_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
        ON DELETE CASCADE
);

-- ========================================
-- Insert sample data: service_projects
-- ========================================

INSERT INTO service_projects
(organization_id, title, description, location, project_date)
VALUES

-- BrightFuture Builders Projects
(1, 'Community Home Repair',
 'Repair homes for low-income families.',
 'Salt Lake City', '2026-06-12'),

(1, 'Youth Construction Workshop',
 'Teach basic construction skills to teenagers.',
 'Provo', '2026-06-20'),

(1, 'Neighborhood Cleanup',
 'Clean abandoned lots and public spaces.',
 'Ogden', '2026-07-02'),

(1, 'Emergency Shelter Build',
 'Construct temporary shelters for displaced families.',
 'Logan', '2026-07-15'),

(1, 'School Renovation Project',
 'Improve classrooms and school facilities.',
 'St. George', '2026-08-01'),


-- GreenHarvest Growers Projects
(2, 'Community Garden Planting',
 'Plant vegetables and fruits for local families.',
 'Boise', '2026-06-10'),

(2, 'Tree Planting Initiative',
 'Plant trees in parks and neighborhoods.',
 'Twin Falls', '2026-06-18'),

(2, 'Sustainable Farming Workshop',
 'Teach sustainable farming techniques.',
 'Idaho Falls', '2026-07-05'),

(2, 'Food Donation Harvest',
 'Harvest crops for donation to food banks.',
 'Nampa', '2026-07-21'),

(2, 'School Gardening Program',
 'Help schools create educational gardens.',
 'Meridian', '2026-08-08'),


-- UnityServe Volunteers Projects
(3, 'Senior Assistance Program',
 'Assist elderly residents with daily tasks.',
 'Dallas', '2026-06-14'),

(3, 'Community Food Drive',
 'Collect food donations for local shelters.',
 'Houston', '2026-06-25'),

(3, 'Back-to-School Supply Event',
 'Provide school supplies for children in need.',
 'Austin', '2026-07-09'),

(3, 'Volunteer Health Fair',
 'Offer free health screenings and information.',
 'San Antonio', '2026-07-22'),

(3, 'Holiday Toy Donation',
 'Collect toys for children during the holidays.',
 'El Paso', '2026-08-12');